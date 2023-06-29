locals {
  service = {
    infra = {
      eks = {
        name        = "${local.common.organization}-eks-${local.common.environment}"
        k8s_version = "1.22"
        argocd_host = true
      }
    }
  }
}