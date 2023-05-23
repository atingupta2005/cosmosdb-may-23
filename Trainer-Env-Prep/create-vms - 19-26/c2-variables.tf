# Input Variables

# 1. Business Unit Name
variable "business_unit" {
  description = "Business Unit Name"
  type = string
  default = "it"
}
# 2. Environment Name
variable "environment" {
  description = "Environment Name"
  type = string
  default = "trng"
}
# 3. Resource Group Name
variable "resoure_group_name" {
  description = "Resource Group Name"
  type = string
  default = "rgvmswin"
}
# 4. Resource Group Location
variable "resoure_group_location" {
  description = "Resource Group Location"
  type = string
  default = "East US"
}

# 5. Virtual Network Name
variable "virtual_network_name" {
  description = "Virtual Network Name"
  type = string 
  default = "vnet"
}

variable "dns_name_prefix" {
  type = string
  default = "huola"
}

variable "admin_username" {
  type = string
  default = "traininguser"
}

variable "admin_password" {
  type = string
  default = "TrngAzure@8972"
}

variable "storage_account_type" {
  type = string
  default = "Standard_LRS"
  #default = "Premium_LRS"
}


# 6. VM Count
variable "vm_count" {
  description = "How many VMs"
  type = number
  default = "1"
}