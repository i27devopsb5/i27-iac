
# Create Multiple Instances of GCE for our i27 infra
resource "google_compute_instance" "tf-vm-instance" {
  for_each = var.instances
  name = each.key   # "ansible"
  machine_type = each.value.instance_type
  zone = each.value.zone
  boot_disk {
    initialize_params {
      image = data.google_compute_image.ubuntu_image.self_link
      size = each.value.disk_size
      type = "pd-standard"
    }
  }
  network_interface {
    network = google_compute_network.i27-ecommerce-vpc.self_link
    subnetwork = each.value.subnet
    access_config {
      // Ephemeral public IP
    }
  }
}

# Data block for image
data "google_compute_image" "ubuntu_image" {
    family = "ubuntu-2004-lts"
    project = "ubuntu-os-cloud"
}