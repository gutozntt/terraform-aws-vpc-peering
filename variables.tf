variable "vpc_id" {
  description = "The Source VPC ID."
}
variable "vpc_peer_dst" {
  description = "The Destination VPC ID."
}
variable "tags" {
  description = "Tags to apply to the Peering Connection."
  default = null
  type = map
}
variable "create_routes" {
  description = "Wheter to create the routes in the both VPCs."
  type    = bool
  default = false
}
