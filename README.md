# Terraform: EC2 + Security Group + Microk8s

A simple EC2 instance with Microk8s + a Security Group that allows SSH from a specified IP address and HTTP.

## Getting Started - How to apply locally

### Prerequisites
- Configured AWS account with IAM credentials and permissions
- SSH keypair (public key can be local or on AWS)
- Terraform installed

### Step 1: Clone the repository
```bash
git clone https://github.com/Davidjuhasz05/terraform-microk8s-ec2-sg.git
cd terraform-microk8s-ec2-sg
```

### Step 2: Configure Terraform
- Create an S3 bucket for the state file with the name `tf-mk8s-vm-state-bucket`

- Remove the `.example` extension from `terraform.tfvars.example`, then fill in the necessary information

### Step 3: Apply the infrastructure
```bash
terraform apply -auto-approve
```
Wait for the creation, and you should be able to SSH into the instance using your private key

### Step 4: Destroy the infra after finishing
```bash
terraform destroy -auto-approve
```