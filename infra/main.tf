terraform {
  required_providers {
    azurerm = { source = "hashicorp/azurerm"; version = "~>3.0" }
  }
}

provider "azurerm" { features {} }

resource "azurerm_resource_group" "sentinel" {
  name     = "sentinel-uae-north-rg"
  location = "uaenorth"
}

resource "azurerm_log_analytics_workspace" "law" {
  name                = "sentinel-law-uae"
  location            = azurerm_resource_group.sentinel.location
  resource_group_name = azurerm_resource_group.sentinel.name
  sku                 = "PerGB2018"
}

resource "azurerm_sentinel_log_analytics_workspace_onboarding" "sentinel" {
  workspace_id = azurerm_log_analytics_workspace.law.id
}
