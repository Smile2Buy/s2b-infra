# s2b-infra

> This repository will store the infrastructure code and configurations under Terraform.

## History

### Nested Implementation
- [x] VPC
- [x] Subnets
  - [x] Public Subnet
    - [x] Set 1 AZ
    - [x] Internet Gateway
    - [x] Route-table & Route-table-association
  - [x] Private Subnet with 
    - [x] Set 1 AZ
    - [x] NAT Gateway & Elastic IP
    - [x] Route-table & Route-table-association
  - [ ] Attach EKS-related Tags to Subnets
  - [ ] Security Group

### Flat Implementation
- [x] VPC
- [x] Subnets
  - [x] Public Subnet
    - [x] Set 2 AZs
    - [x] Internet Gateway
    - [x] Route-table & Route-table-association
  - [x] Private Subnet -1az
    - [x] Set 2 AZs
    - [x] NAT Gateway & Elastic IP
    - [x] Route-table & Route-table-association

### CDK Implementation

## FIXME
- [ ] Public IP allocation in EIP
- [ ] Improve IAM strategies (currently using admin_policy by key-owner)

---

230629 04:24 architecture diagram
![graph](https://github.com/Smile2Buy/s2b-infra/assets/28827932/6d6c1787-289f-4bf3-a888-79bdf9dabfce)
