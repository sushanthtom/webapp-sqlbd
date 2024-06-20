variable "resource_group_name" {
  description = "The name of the resource group"
  default     = "rgp-test001"
}

variable "location" {
  description = "The location for the resources"
  default     = "Central India"
}

variable "vnet_name" {
  description = "The name of the virtual network"
  default     = "vnet-test001"
}

variable "vnet_address_space" {
  description = "The address space for the virtual network"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

variable "subnet_name" {
  description = "The name of the subnet"
  default     = "snet-test001"
}

variable "subnet_address_prefixes" {
  description = "The address prefixes for the subnet"
  type        = list(string)
  default     = ["10.0.2.0/24"]
}

variable "nsg_name" {
  description = "The name of the network security group"
  default     = "nsg-test001"
}

variable "public_ip_name_ubuntu" {
  description = "The name of the public IP for Ubuntu VM"
  default     = "pip-test001"
}

#variable "public_ip_name_windows" {
#  description = "The name of the public IP for Windows VM"
 # default     = "example-public-ip-windows"
#}

variable "nic_name_ubuntu" {
  description = "The name of the network interface for Ubuntu VM"
  default     = "nic-test001"
}

#variable "nic_name_windows" {
 # description = "The name of the network interface for Windows VM"
  #default     = "example-nic-windows"
#}

variable "vm_name_ubuntu" {
  description = "The name of the Ubuntu virtual machine"
  default     = "vm-test001"
}

variable "vm_size_ubuntu" {
  description = "The size of the Ubuntu virtual machine"
  default     = "Standard_DS1_v2"
}

variable "admin_username_ubuntu" {
  description = "The admin username for the Ubuntu VM"
  default     = "adminuser"
}

variable "admin_password_ubuntu" {
  description = "The admin password for the Ubuntu VM"
  default     = "Test12345@"
}

#variable "vm_name_windows" {
 # description = "The name of the Windows virtual machine"
  #default     = "example-machine-windows"
#}

#variable "vm_size_windows" {
 # description = "The size of the Windows virtual machine"
  #default     = "Standard_DS1_v2"
#}

#variable "admin_username_windows" {
 # description = "The admin username for the Windows VM"
  #default     = "adminuser"
#}

#variable "admin_password_windows" {
#  description = "The admin password for the Windows VM"
#  default     = "P@ssword1234!"
#}

variable "azurerm_sql_server" {
  description = "The name of the SQL server"
  default     = "sqlsrvr-test001"
}

variable "sql_admin_username" {
  description = "The admin username for the SQL server"
  default     = "sqladmin"
}

variable "sql_admin_password" {
  description = "The admin password for the SQL server"
  default     = "Test12345@"
}

variable "azurerm_sql_database" {
  description = "The name of the SQL database"
  default     = "sqldb-ueres-dev"
}

variable "azurerm_app_service_plan" {
  description = "The name of the App Service Plan"
  default     = "applan-dev001"
}

variable "azurerm_app_service" {
  description = "The name of the App Service"
  default     = "apps-devv01"
}
