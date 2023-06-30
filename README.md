# s2b-infra

> This repository will store the infrastructure code and configurations under Terraform.

## TODO

- Setup
    - [x] VPC
    - [x] public-subnet
        - [x] internet-gateway
        - [x] route-table & route-table-association
    - [x] private-subnet
        - [x] NAT gateway
        - [x] Elastic IP
        - [x] route-table & route-table-association
    - [ ] Add EKS-related tags to subnets
    - [ ] Security group setting

- Setup (flat version)
    - [x] VPC
    - [x] Internet Gateway
    - [x] Private/public Subnets
    - [x] EIP & NAT Gateway
    - [x] Route Tables & Associations

## FIXME

- [ ] Public IP allocation in EIP
- [ ] Improve IAM strategies (currently using admin_policy by key-owner)

---

230620 04:24 architecture diagram
![graph](https://github.com/Smile2Buy/s2b-infra/assets/28827932/6d6c1787-289f-4bf3-a888-79bdf9dabfce)