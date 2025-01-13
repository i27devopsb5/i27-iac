


# Creating a vpc
resource "google_compute_network" "i27-ecommerce-vpc" {
  # arguments to build the vpc
  name = var.vpc_name
  auto_create_subnetworks = false
}

# Create Multiple Subnets
resource "google_compute_subnetwork" "i27-ecommerce-subnets" {
  count = length(var.subnets)
  name = var.subnets[count.index].name
  ip_cidr_range = var.subnets[count.index].ip_cidr_range
  region = var.subnets[count.index].subnet_region
  network = google_compute_network.i27-ecommerce-vpc.self_link
}



# # create subnet-1
# resource "google_compute_subnetwork" "subnet-1" {
#   name = "subnet-1"
#   network =  google_compute_network.i27-ecommerce-vpc.id
#   ip_cidr_range = "10.1.0.0/16"
#   region = "us-central1"
#   # depends_on = [ google_compute_network.i27-ecommerce-vpc ] its a meta argument 
# }

# # create subnet-2
# resource "google_compute_subnetwork" "subnet-2" {
#   name = "subnet-2"
#   network = "i27-ecommerce-vpc"
#   ip_cidr_range = "10.2.0.0/16"
#   region = "us-east4"
# }
# # create subnet-3
# resource "google_compute_subnetwork" "subnet-1" {
#   name = "subnet-3"
#   network = "i27-ecommerce-vpc"
#   ip_cidr_range = "10.1.0.0/16"
#   region = "us-west4"
# }