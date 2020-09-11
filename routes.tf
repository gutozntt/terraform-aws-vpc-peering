data "aws_route_tables" "vpc_rts" {
  vpc_id = var.vpc_id
}

data "aws_route_tables" "dst_vpc_rts" {
  vpc_id = var.vpc_peer_dst
}

data "aws_vpc" "vpc" {
  id = var.vpc_id
}

data "aws_vpc" "dst_vpc" {
  id = var.vpc_peer_dst
}

resource "aws_route" "vpc_rts" {
  count                     = var.create_routes ? length(data.aws_route_tables.vpc_rts.ids) : 0
  route_table_id            = tolist(data.aws_route_tables.vpc_rts.ids)[count.index]
  destination_cidr_block    = data.aws_vpc.dst_vpc.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.this.id
}

resource "aws_route" "dst_vpc_rts" {
  count                     = var.create_routes ? length(data.aws_route_tables.dst_vpc_rts.ids) : 0
  route_table_id            = tolist(data.aws_route_tables.dst_vpc_rts.ids)[count.index]
  destination_cidr_block    = data.aws_vpc.vpc.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.this.id
}
