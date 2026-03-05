#!/usr/bin/env bash
set -euo pipefail

ENVIRONMENT="${1:-}"
ACTION="${2:-plan}" # plan|apply

if [[ -z "$ENVIRONMENT" ]]; then
  echo "Usage: ./scripts/tf-plan.sh <dev|prod> <plan|apply>"
  exit 1
fi

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
ENV_DIR="${ROOT_DIR}/envs/${ENVIRONMENT}"

if [[ ! -d "$ENV_DIR" ]]; then
  echo "Environment folder not found: $ENV_DIR"
  exit 1
fi

cd "$ENV_DIR"

echo "==> Terraform init (remote backend)"
terraform init -backend-config=backend.hcl -upgrade

echo "==> Formatting check"
terraform fmt -check -recursive

echo "==> Validate"
terraform validate

echo "==> Plan"
terraform plan -out=tfplan

if [[ "$ACTION" == "apply" ]]; then
  echo "==> Apply (from saved plan)"
  terraform apply tfplan
else
  echo "==> Done. Plan saved as ${ENV_DIR}/tfplan"
fi