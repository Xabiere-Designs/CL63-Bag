locals {
  name = "${var.org}-${var.project}-${var.env}"

  tags = merge(var.tags, {
    Environment = var.env
    ManagedBy   = "Terraform"
    Project     = var.project
    Owner       = var.owner
  })
}

locals {

  db_secret_policy = jsonencode({
    Version = "2012-10-17"

    Statement = [
      {
        Effect = "Allow"

        Action = [
          "secretsmanager:GetSecretValue"
        ]

        Resource = module.rds.db_secret_arn
      }
    ]
  })
}