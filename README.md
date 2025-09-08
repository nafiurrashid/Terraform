# Terraform
<img width="1249" height="575" alt="image" src="https://github.com/user-attachments/assets/686c8a49-c9f2-48b1-b9c6-8cd69e315143" />

Description

Context
You are a DevOps engineer in a company that is migrating its on-premises applications to AWS. You've been tasked with ensuring the security posture of your cloud environment.
Objective
Create an Infrastructure as Code (IaC) template using Terraform that accomplishes the following:
1. Sets up a VPC (Virtual Private Cloud) with private and public subnets.
2. Deploys an EC2 instance into the private subnet.
3. Sets up a Security Group that allows only necessary ports to be open.
4. Uses IAM Roles to grant the EC2 instance only the permissions it needs (Least Privilege).
5. Sets up CloudTrail to log API calls for your account.
6. Enable encryption for any storage services you use (EBS, S3, etc.)

Constraints
- Use Terraform to create your infrastructure.
- Make use of modules to make your code re-usable.
- Incorporate best practices for AWS security (e.g., enable VPC flow logs, disable root user, etc.)
Bonus
- Implement AWS Config to enforce security policies.
- Set up a CloudWatch Alarm that triggers if any unauthorized actions are performed.
- Use AWS Secrets Manager to store any sensitive information.
Deliverables
- Terraform files (.tf) for your infrastructure.
- A README file that explains:
- How to deploy your infrastructure.
- Security best practices that you implemented.
- Any assumptions or design choices you made.
