module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "my-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["ap-northeast-2a"]
  private_subnets = ["10.0.1.0/24"]
  public_subnets  = ["10.0.101.0/24"]

  enable_nat_gateway = false
  enable_vpn_gateway = false

  tags = {
    Environment = "test"
    Name        = "my-vpc"
  }
}

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "17.1.0"

  cluster_name    = "my-cluster"
  cluster_version = "1.20"
  vpc_id          = module.vpc.vpc_id
  subnets         = [module.vpc.private_subnets]

  node_groups = {
    eks_nodes = {
      desired_capacity = 2
      max_capacity     = 10
      min_capacity     = 1

      instance_type = "t2.micro"
      key_name      = "my-key-name"
    }
  }
}
