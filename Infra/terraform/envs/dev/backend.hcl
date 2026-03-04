bucket         = "my-tf-state-dev"
key            = "eks-platform/dev/terraform.tfstate"
region         = "us-east-1"
dynamodb_table = "terraform-locks"
encrypt        = true