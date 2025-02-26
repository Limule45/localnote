provider "google" {
  project     = "opti-services-complexes"
  region      = "us-central1"
  credentials = var.gcp_credentials
}

variable "gcp_credentials" {}

resource "google_compute_instance" "default" {
  name         = "test-vm-1"
  machine_type = "e2-micro"
  zone         = "europe-west1-b"

  boot_disk {
    initialize_params {
      image = "debian-12-bookworm-v20250212"
    }
  }

  network_interface {
    network = "default"
    access_config {}
  }
}
