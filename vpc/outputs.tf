
output "default_vpc" {
  value       = aws_vpc.default_vpc
  description = "Vpc output credentials"
}


output "private_subnet" {
  value = {
    for instance in aws_subnet.public_subnet :
    "ids" => instance.id...
  }

  description = "Private subnet credentials"
}

output "public_subnet" {
  value       = aws_subnet.public_subnet
  description = "Public subnet credentials"
}
