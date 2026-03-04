bucket         = "my-tf-state-prod"
key            = "eks-platform/prod/terraform.tfstate"
region         = "us-east-1"
dynamodb_table = "terraform-locks"
encrypt        = true