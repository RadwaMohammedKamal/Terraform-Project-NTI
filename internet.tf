resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.imported_vpc.id

  tags = local.common_tags
}
