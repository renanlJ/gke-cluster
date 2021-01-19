variable "regions" {
    type = map(string)

    default = {
        "a" = "southamerica-east1-a"
        "c" = "southamerica-east1-c"
    }
}

variable "lista_numeros" {
  type = list(number)
  default = [123, 321]
  # var.lista_numeros
}

variable "gke_cluster_namme" {
    default = "my-cluster"
}

variable "machine_type" {
    default = "e2-standard-4"
}

variable "project_name" {
    default = "certain-benefit-179317"
}

variable "file_sa" {
    default = "./creds/serviceaccount.json"
}