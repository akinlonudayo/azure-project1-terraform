resource "azurerm_mssql_server" "sqlprimary01122025" {
  name                         = "sql-primary"
  resource_group_name          = azurerm_resource_group.rg.name
  location                     = azurerm_resource_group.rg.location
  administrator_login          = "sqladmin"
  administrator_login_password = "StrongP@ssw0rd!"
  version                      = "12.0"
}

resource "azurerm_mssql_database" "bankingdb" {
  name        = "bankingdb"
  server_id   = azurerm_mssql_server.sqlprimary01122025.id
  sku_name    = "S0"
  collation   = "SQL_Latin1_General_CP1_CI_AS"
  max_size_gb = 5
}

# Secondary server can be created using azurerm_mssql_server with geo-replication
