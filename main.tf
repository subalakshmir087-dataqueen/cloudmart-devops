provider "google" {
  project = "gcp-devops-project-498805"
  region  = "us-central1"
}
resource "google_artifact_registry_repository" "repo" {
  location      = "us-central1"
  repository_id = "cloudmart-repo"
  format        = "DOCKER"
}
resource "google_container_cluster" "gke" {
  name     = "cloudmart-cluster"
  location = "us-central1-a"

  remove_default_node_pool = true
  initial_node_count       = 1
}
resource "google_container_node_pool" "primary_nodes" {
  name       = "cloudmart-node-pool"
  cluster    = google_container_cluster.gke.name
  location   = "us-central1-a"
  node_count = 2

  node_config {
    machine_type = "e2-small"
  }
}
resource "google_compute_instance" "jenkins_vm" {
  name         = "jenkins-ci-host"
  machine_type = "e2-medium"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2204-lts"
    }
  }

  network_interface {
    network = "default"
    access_config {}
  }
}
