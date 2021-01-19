provider "google" {
    credentials = file(var.file_sa)
    project     = var.project_name
    region      = var.regions["c"]
}

resource "google_container_cluster" "gke-cluster" {
  name                      = var.gke_cluster_namme
  location                  = var.regions["c"]

  remove_default_node_pool  = true
  initial_node_count        = 1
  
  timeouts {
    create = "60m"
    delete = "2h"
  }
}

resource "google_container_node_pool" "preemptible_nodes" {
  name        = "my-node-pool"
  location    = var.regions["c"]
  cluster     = google_container_cluster.gke-cluster.name
  node_count  = 4

  autoscaling {
    min_node_count = 1
    max_node_count = 4
  }

  node_config {
    preemptible  = true
    machine_type = var.machine_type
  }
}