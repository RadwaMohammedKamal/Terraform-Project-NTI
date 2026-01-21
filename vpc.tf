resource "aws_vpc" "imported_vpc" {
  cidr_block = "10.0.0.0/16"

  lifecycle {
    prevent_destroy = true
  }

  tags = {
    Name = "imported_vpc"
  }
}
