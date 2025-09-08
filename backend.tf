terraform {
  backend "s3" {
    bucket         = "security-project-terraform-state-bucket"       # Replace with your actual bucket
    key            = "env/dev/terraform.tfstate"          # Change path as needed
    region         = "ap-south-1"                          # Your AWS region
    encrypt        = true
    #dynamodb_table = "terraform-locks"                    # Must exist for state locking
  }
}
