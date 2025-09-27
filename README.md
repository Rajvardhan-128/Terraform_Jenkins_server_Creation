# Terraform Jenkins Server Creation

![Terraform](https://img.shields.io/badge/Terraform-IaC-7B42BC?logo=terraform&logoColor=white)  
![AWS](https://img.shields.io/badge/AWS-Cloud-orange?logo=amazon-aws&logoColor=white)  
![Jenkins](https://img.shields.io/badge/Jenkins-CI%2FCD-D33833?logo=jenkins&logoColor=white)  
![GitHub](https://img.shields.io/badge/GitHub-Repo-181717?logo=github&logoColor=white)  

---

This repository contains Terraform configuration for provisioning a **Jenkins server** on AWS.

---

✅ What this project does

- Create the S3 Bucket first 
- Creates an **EC2 instance** to host Jenkins  
- Sets up **security groups** to allow necessary traffic (e.g. HTTP, SSH)  
- Installs Jenkins and its dependencies on the instance  
- Sets up Terraform and environment on that EC2 machine  
- (Optional) Connects with other components or pipelines

---

🛠️ Prerequisites

You’ll need:

- Terraform installed locally  
- AWS CLI configured with credentials that can create EC2, IAM, Security Groups, etc.  
- A key pair in AWS (or ability to create one) for SSH access to the EC2 instance  

---

⚙️ Steps to use this repo

1. Clone the repo
   ```bash
   git clone https://github.com/Rajvardhan-128/Terraform_Jenkins_server_Creation.git
   cd Terraform_Jenkins_server_Creation

2. Customize variables
Edit variables.tf or pass terraform.tfvars to set things like:

EC2 instance type

AMI ID or filters

SSH key name

Security group rules

3. Initialize Terraform

       terraform init

4. plan

       terraform plan
   
5. Apply Infrastructure

       terraform apply --auto-approve

6. SSH into Jenkins Server
After apply, you’ll get the public IP in the outputs.

       ssh -i your-key.pem ec2-user@<INSTANCE_IP>


7. Verify Jenkins is running
Open in browser:

       http://<INSTANCE_IP>:8080


🗂️ Example Directory Structure
    
    .
    ├── main.tf            # Main Terraform resources (EC2, SG, etc.)
    ├── variables.tf       # Input variables
    ├── outputs.tf         # Output values (e.g. instance IP)
    ├── user_data.sh       # Script to bootstrap Jenkins installation
    └── terraform.tfvars   # Your environment-specific variable values

    
🔒 Security & Best Practices

Don’t commit .tfstate files or sensitive files — use a .gitignore like:

    .terraform/
    *.tfstate
    *.tfvars


Use proper IAM roles and policies rather than wide-open permissions.

For production, restrict security group rules (e.g. avoid “0.0.0.0/0” except where absolutely necessary).

Consider using remote state backend (S3 + DynamoDB) for state locking and security.

🤝 Contributing

Feel free to open issues or submit pull requests. I welcome suggestions to improve this setup — e.g. adding backup, SSL for Jenkins, autoscaling, etc.


👤 Author

Rajvardhan
Terraform | AWS | DevOps | Jenkins
