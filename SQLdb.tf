resource "azurerm_sql_server" "example" {
  name                         = var.azurerm_sql_server
  resource_group_name          = azurerm_resource_group.functionapp.name
  location                     = azurerm_resource_group.functionapp.location
  version                      = "12.0"
  administrator_login          = var.sql_admin_username
  administrator_login_password = var.sql_admin_password

  tags = {}
}

resource "azurerm_sql_database" "example" {
  name                = var.azurerm_sql_database
  resource_group_name = azurerm_resource_group.functionapp.name
  location            = azurerm_resource_group.functionapp.location
  server_name         = azurerm_sql_server.example.name
  collation           = "SQL_Latin1_General_CP1_CI_AS"
  max_size_bytes      = 34359738368
  edition             = "GeneralPurpose"
  requested_service_objective_name = "GP_S_Gen5_1"

  tags = {}
}
#resource "azurerm_sql_database_extended_auditing_policy" "example" {
#  resource_group_name  = azurerm_resource_group.functionapp.name
#  server_name          = azurerm_sql_server.functionapp.name
#  database_name        = azurerm_sql_database.functionapp.name
#  storage_account_access_key = "your_storage_account_access_key"
#  storage_endpoint             = "https://yourstorageaccount.blob.core.windows.net/"
#  retention_in_days            = 30
#  audit_actions_and_groups = [
#    "SUCCESSFUL_DATABASE_AUTHENTICATION_GROUP",
#    "FAILED_DATABASE_AUTHENTICATION_GROUP",
#    "BATCH_COMPLETED_GROUP"
#  ]
#}