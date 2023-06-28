module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = "my-cluster"
  cluster_version = "1.20"
  subnets         = [aws_subnet.public.id, aws_subnet.private.id]
  vpc_id          = aws_vpc.main.id

  node_groups = {
    eks_nodes = {
      desired_capacity = 2
      max_capacity     = 10
      min_capacity     = 1

      instance_type = "t2.micro"
      key_name      = "s2b-key"
    }
  }
}
