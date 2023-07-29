# s2b-infra

> This repository will store the infrastructure code and configurations under Terraform.

## History

### CDKTF Implementation
- [X] Bootstrap CDK for Terraform Project
    - [X] Inititate directory for cdktf
    - [X] Migrate project to gradle 
    - [X] Modify gradle configs
    - [X] Configure node version via nvmrc
    - [X] Set Terraform Cloud API token in local machine
    - [X] Set Terraform Cloud as remote-backend
    - [X] Initiate workspace in Terraform Cloud Web
    - [X] Connect workspace with infra-repository
    - [X] Complete the workflow

### GitOps
- [x] AutoLabel -- Attach labels of type and domain to the opened PR
- [x] ReleaseDrafter -- Build a drafter of release note when code push to [main] branch occurs
- [x] HistorySpoke -- Send message to Hisory-hub repository when README.md has been changed

---

230629 04:24 architecture diagram
![graph](https://github.com/Smile2Buy/s2b-infra/assets/28827932/6d6c1787-289f-4bf3-a888-79bdf9dabfce)
