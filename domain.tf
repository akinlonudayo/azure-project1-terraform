variable "mydomain" {
  type        = string
  description = "The DNS zone name (e.g. example.com)"
  default     = "mybankingdomain.com"
}

resource "azurerm_dns_zone" "mydomain" {
  name                = var.mydomain
  resource_group_name = azurerm_resource_group.rg.name
}