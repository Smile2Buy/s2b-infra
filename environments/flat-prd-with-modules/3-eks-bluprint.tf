module "eks_blueprints" {
  source = "github.com/aws-ia/terraform-aws-eks-blueprints?ref=v4.32.1"

  cluster_name    = "demo"
  cluster_version = "1.27"
  enable_irsa     = true // For holding the concept of "least privilege" in security

  vpc_id             = module.vpc.vpc_id
  private_subnet_ids = module.vpc.private_subnets
  managed_node_groups = {
    role = {
      capacity_type   = "ON_DEMAND"
      node_group_name = "general"
      instance_types  = ["t3.micro"]
      desired_size    = "1" //TODO: to auto-scale EKS cluster, additionally deploy CAS/Carpenter
      max_size        = "3"
      min_size        = "1"
    }
  }
}