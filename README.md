# VPC Peering Module - AWS

This module will create a VPC Peering between two VPCs in the REGION. It also has the option to create the routes in all the route tables from both Source and Destination VPC.

- This module currently DOES NOT support cross-region peerings. Work in Progress.

## Example of usage:

```
module "vpc_peering" {
  source = "./module-vpc-peering"

  vpc_id        = "vpc-123456"
  vpc_peer_dst  = "vpc-789123"
  create_routes = true
  tags          = {
    Terraform   = "true"
  }
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| create\_routes | Wheter to create the routes in the both VPCs. | `bool` | `false` | no |
| tags | Tags to apply to the Peering Connection. | `map` | `null` | no |
| vpc\_id | The Source VPC ID. | `any` | n/a | yes |
| vpc\_peer\_dst | The Destination VPC ID. | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| peering\_id | The Peering Connection ID. |
