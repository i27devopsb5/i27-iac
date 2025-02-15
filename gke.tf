# terraform resource to create kubernetes clusters
resource "google_container_cluster" "primary" {
  name               = "i27-cluster"
  location           = "us-central1-a"
  initial_node_count = 1
  node_config {
   machine_type = "e2-medium"
   disk_size_gb = "30"
  }
}
