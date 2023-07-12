# s2b-infra

> This repository will store the infrastructure code and configurations under Terraform.

## History

### CDKTF Implementation

### Nested Implementation
- [x] Bootstrapped Basic Infra
    - [x] VPC
    - [x] Subnets
        - [x] Public Subnet; 1 AZ, Internet Gateway, Route-table & Route-table-association
        - [x] Private Subnet; 1 AZ, NAT Gateway & Elastic IP, Route-table & Route-table-association
    - [ ] Attach EKS-related Tags to Subnets
    - [ ] Security Group

### Flat Implementation
- [x] Bootstrapped Basic Infra
    - [x] VPC
    - [x] Subnets
        - [x] Public Subnet; 2 AZs, Internet Gateway, Route-table & Route-table-association
        - [x] Private Subnet; 2 AZs, NAT Gateway & Elastic IP, Route-table & Route-table-association

### GitOps
- [x] AutoLabel -- Attach labels of type and domain to the opened PR
- [x] ReleaseDrafter -- Build a drafter of release note when code push to [main] branch occurs
- [x] HistorySpoke -- Send message to Hisory-hub repository when README.md has been changed

## FIXME
- [ ] Public IP allocation in EIP
- [ ] Improve IAM strategies (currently using admin_policy by key-owner)

---

230629 04:24 architecture diagram
![graph](https://github.com/Smile2Buy/s2b-infra/assets/28827932/6d6c1787-289f-4bf3-a888-79bdf9dabfce)
