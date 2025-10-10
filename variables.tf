variable "aws_region" {
  description = "AWS region to deploy into"
  type        = string
  default     = "eu-central-1"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.small"
}

variable "ssh_cidr" {
  description = "CIDR allowed to SSH into the VM"
  type        = string
  default     = "0.0.0.0/0"
}

variable "key_name" {
  description = "Existing AWS key pair name to use"
  type        = string
  default     = ""
}

variable "public_key" {
  description = "Public SSH key contents for the EC2 instance. Provide this when create_key_pair = true."
  type        = string
  sensitive   = true
  default     = ""

  validation {
    condition     = var.create_key_pair ? (length(trimspace(var.public_key)) > 0) : true
    error_message = "When create_key_pair = true you must provide a public_key (the public key contents)."
  }
}

variable "create_key_pair" {
  description = "If true, Terraform will create an AWS key pair using public_key"
  type        = bool
  default     = false
}

variable "subnet_id" {
  description = "Subnet ID to launch the instance in. If empty, will use the default subnet in the region."
  type        = string
  default     = ""
}

variable "tags" {
  description = "Map of tags to apply"
  type        = map(string)
  default     = {}
}