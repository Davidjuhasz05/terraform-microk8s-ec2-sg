terraform {
  backend "s3" {
    bucket       = "tf-mk8s-vm-state-bucket"
    key          = "tf-mk8s-vm/terraform.tfstate"
    region       = "eu-central-1"
    use_lockfile = true
    encrypt      = true
  }
}
