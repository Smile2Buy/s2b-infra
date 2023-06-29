variable "organization" {
  type        = string
  description = "organization name"
}

variable "environment" {
  type        = string
  description = "environment of CI/CD pipeline"
}

variable "config" {
  type = object({
    infra = object({
      eks = object({
        name        = string
        k8s_version = string
        argocd_host = bool
      })
    })
  })
  description = "configs for service-layer"
}
