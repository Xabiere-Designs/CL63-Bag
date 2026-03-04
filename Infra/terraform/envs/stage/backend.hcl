bucket         = "my-tf-state-stage"
key            = "eks-platform/stage/terraform.tfstate"
region         = "us-east-1"
dynamodb_table = "terraform-locks"
encrypt        = true