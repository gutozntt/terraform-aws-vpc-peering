# Requester's side of the connection.
resource "aws_vpc_peering_connection" "this" {
  vpc_id                          = var.vpc_id
  peer_vpc_id                     = var.vpc_peer_dst
  auto_accept                     = true

  tags = var.tags
}
