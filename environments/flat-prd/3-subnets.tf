resource "aws_subnet" "private_ap_northeast_2a" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.0.0/19"
  availability_zone = "ap-northeast-2a"

  // Tags are needed to expose my applications to the outside world
  tags = {
    "Name"                            = "private-ap-northeast-2a"
    "kubernetes.io/role/internal-elb" = "1" // private lb
    "kubernetes.io/cluster/demo-2"    = "owned"
  }
}

resource "aws_subnet" "private_ap_northeast_2b" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.32.0/19"
  availability_zone = "ap-northeast-2b"

  tags = {
    "Name"                            = "private-ap-northeast-2b"
    "kubernetes.io/role/internal-elb" = "1" // private lb
    "kubernetes.io/cluster/demo-2"    = "owned"
  }
}

resource "aws_subnet" "public_ap_northeast_2a" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.64.0/19"
  availability_zone       = "ap-northeast-2a"
  map_public_ip_on_launch = true

  tags = {
    "Name"                         = "public-ap-northeast-2a"
    "kubernetes.io/role/elb"       = "1" // public lb
    "kubernetes.io/cluster/demo-2" = "owned"
  }
}

resource "aws_subnet" "public_ap_northeast_2b" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.96.0/19"
  availability_zone       = "ap-northeast-2b"
  map_public_ip_on_launch = true

  tags = {
    "Name"                         = "public-ap-northeast-2b"
    "kubernetes.io/role/elb"       = "1" // public lb
    "kubernetes.io/cluster/demo-2" = "owned"
  }
}
