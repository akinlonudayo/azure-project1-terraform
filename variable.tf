variable "resource_group_name" {
  type    = string
  default = "rg-banking"
}

variable "location" {
  type    = string
  default = "westus2"
}

variable "vnet_name" {
  type    = string
  default = "vnet-banking"
}

variable "address_space" {
  type    = list(string)
  default = ["10.0.0.0/16"]
}

variable "subnet_frontend" {
  type    = string
  default = "10.0.1.0/24"
}

variable "subnet_backend" {
  type    = string
  default = "10.0.2.0/24"
}

variable "subnet_datatier" {
  type    = string
  default = "10.0.3.0/24"
}

variable "admin_username" {
  type    = string
  default = "adminuser"
}

variable "ssh_public_key" {
  type    = string
  default = "~/.ssh/id_rsa.pub"
}
