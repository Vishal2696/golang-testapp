# golang-testapp

**Description:**
    
This repo contains the instructions on how to deploy a containerised version of servian Techchallenge app in AWS using EKS and RDS. 
 
The Techchallenge app is a simple application written in Go and connects to a postgresql DB. More information on the application's code and functioning can be obtained from it's parent repository. 
https://github.com/servian/TechChallengeApp
 
 **Requirements:**
 1. Terraform version v0.12.24 (`terraform --version`).    
 2. AWS Account with a user or role access to `ec2:*`, `rds:*`, `eks:*`, IAM access to create,delete,attach,detach IAM roles and policies 
 3. kubectl v1.19.2 (Preferred).
 4. aws cli version aws-cli/2.0.52 (`aws --version`)
 5. Basic knowledge of AWS, Terraform and Kubernetes.
 
**Limitation:**

This implementation is designed to be launched in aws region `ap-south-1`. This was done to save time on my side

**List of Resources Deployed:**

1. VPC (1)
2. Subnets (4, 2 - Public, 2-Private)
3. Route Tables (2)
4. Internet Gateway (1)
5. IAM Roles (2)
6. RDS Subnet group (1)
7. RDS PostgreSQL Instance (1, db.t3.micro)
8. EKS Cluster (1)
9. EKS node groups (1, EC2 - 1 t3.medium)
10. Classic Load Balancer (1, Created by kubernetes service. not by terraform)

**Deployment Instructions:**

Please refer to the `deployment-instructions.md` file to see the steps to deploy this application.

**Destruction Instructions:**

Please refer to the `destroy-instructions.md` file for a safe destroy of all the resources created.

**My Decisions:**

I want to address out certain decisions that I have taken for this deployment below. 
1. I did not use AWS load balancer ingress controller to expose the application just to save my time and to simplify the deployment process. The same application can very well be exposed using AWS load balancer ingress controller also.
2. I did not want to include the ability to deploy to any aws region just to save my time and simplify the documentation part. This support can very well be added by including the terraform `data` resources and using `map` type variables.
