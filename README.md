# s2b-infra

> This repository will store the infrastructure code and configurations under Terraform.

## TODO

- [ ] ~~Setup EKS cluster~~
- [ ] ~~Setup ECR repository~~
- [ ] ~~Setup ArgoCD installation~~
- [ ] ~~Setup IAM~~
- Setup
    - [x] VPC
    - [x] public-subnet
        - [x] internet-gateway
        - [x] route-table & route-table-association
    - [ ] private-subnet
        - [ ] NAT gateway
        - [ ] route-table & route-table-association
    - [ ] Add EKS-related tags to subnets
