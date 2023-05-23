az login -u test1@atingupta2005gmailcom.onmicrosoft.com -p <Password>
az account set --subscription "Pay as you go - 2"
az account show

terraform init

terraform plan

# deploy terraform infra
terraform apply --auto-approve

# Terraform Output Commands
terraform output
terraform output resource_group_id
terraform output virtual_network_name

# Generate machine-readable output
terraform output -json

# destroy infra
terraform destroy

