resource "aws_eip" "nat" {
  vpc = true

  /* TODO: manually allocate public IP
      when I need to whitelist them with our clients in the future */

  tags = {
    Name = "nat"
  }
}

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public_ap_northeast_2a.id

  tags = {
    Name = "nat"
  }

  depends_on = [aws_internet_gateway.igw]
}