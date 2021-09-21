# # Rules for network access list in VPC.
# resource "aws_network_acl" "test_nacl" {
#   vpc_id = aws_vpc.default_vpc.id

#   egress = [
#     {
#       protocol   = "tcp"
#       rule_no    = 200
#       action     = "allow"
#       cidr_block = "0.0.0.0/0"
#       from_port  = 443
#       to_port    = 443
#     }
#   ]

#   ingress = [
#     {
#       protocol   = "tcp"
#       rule_no    = 100
#       action     = "allow"
#       cidr_block = "0.0.0.0/0"
#       from_port  = 80
#       to_port    = 80
#     },
#     {
#       protocol   = "tcp"
#       rule_no    = 120
#       action     = "allow"
#       cidr_block = "0.0.0.0/0"
#       from_port  = 443
#       to_port    = 443
#     },
#     {
#       protocol   = "tcp"
#       rule_no    = 130
#       action     = "allow"
#       cidr_block = "0.0.0.0/0"
#       from_port  = 22
#       to_port    = 22
#     }
#   ]

#   tags = {
#     Name = "main"
#   }
# }
