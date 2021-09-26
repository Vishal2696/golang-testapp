# golang-testapp

**Description:**
    
 This repo contains the instructions on how to deploy the servian Techchallenge app in AWS using EKS and RDS. 
 **Requirements:**
 1. Terraform version v0.12.24 (`terraform --version`).    
 2. AWS Account with a user or role access to `ec2:*`, `rds:*`, `eks:*`, IAM access to create,delete,attach,detach IAM roles and policies 
 3. kubectl v1.19.2 (Preferred).
 
**Limitation:**

This implementation is designed to be launched in aws region `ap-south-1`. This was done to save time on my side

**Deployment Instructions:**

Please refer to the deployment-instructions.md file to see the steps to deploy this application.
