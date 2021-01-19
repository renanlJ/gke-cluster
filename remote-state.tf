terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "renan-dev"

    workspaces {
      name = "gcp-renan-dev"
    }
  }
}