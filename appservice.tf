resource "azurerm_resource_group" "functionapp" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_app_service_plan" "functionapp_plan" {
  name                = var.azurerm_app_service_plan
  location            = azurerm_resource_group.functionapp.location
  resource_group_name = azurerm_resource_group.functionapp.name
  kind                = "Linux"
  reserved            = true
  sku {
    tier = "Basic"
    size = "B1"
  }
}

resource "azurerm_app_service" "sample_n" {
  name                = var.azurerm_app_service
  location            = azurerm_resource_group.functionapp.location
  resource_group_name = azurerm_resource_group.functionapp.name
  app_service_plan_id = azurerm_app_service_plan.functionapp_plan.id

  site_config {
    linux_fx_version = "DOTNETCORE|6.0"
  }

  https_only = true
}
