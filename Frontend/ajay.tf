terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.32.0"
    }
  }
}

provider "azurerm" {
  # Configuration options
    features {}
    subscription_id = "cebec115-76a4-41a3-b52f-1485335c2232"
}
resource "azurerm_resource_group" "G1" {
  name     = "rohit_rg1"
  location = "West Europe"
}
resource "azurerm_storage_account" "S1" {
  name                     = "rohitstr11"
  resource_group_name      = "rohit_rg1"
  location                 = "eastus"
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
resource "azurerm_resource_group" "G2" {
  name     = "rohit_rg2"
  location = "West Europe"
}
resource "azurerm_storage_account" "S2" {
    depends_on = [ azurerm_resource_group.G2 ]
  name                     = "rohitstr12"
  resource_group_name      = "rohit_rg2"
  location                 = "west Europe"
  account_tier             = "Standard"
  account_replication_type = "LRS"
}