terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "2.8.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.8.1"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.77"
    }
  }
  backend "azurerm" {
    use_cli              = true                      # Can also be set via `ARM_USE_CLI` environment variable.
    use_azuread_auth     = true                      # Can also be set via `ARM_USE_AZUREAD` environment variable.
    storage_account_name = "tfstatestorage2079"      # Can be passed via `-backend-config=`"storage_account_name=<storage account name>"` in the `init` command.
    container_name       = "tfstate-container"       # Can be passed via `-backend-config=`"container_name=<container name>"` in the `init` command.
    key                  = "anton.terraform.tfstate" # Can be passed via `-backend-config=`"key=<blob key name>"` in the `init` command.
  }

}

provider "azurerm" {
  features {}
  # Configuration options
}