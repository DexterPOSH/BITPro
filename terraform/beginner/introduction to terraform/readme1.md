# Introduction to Terraform & writing modules

TODO:

- [ ] Cover Terraform basics
- [ ] Set up auth with Azure provider
- [ ] Show simple import
- [ ] Create resources
- [ ] Create modules
- [ ] Using modules

## Basics

- Terraform workflow (write-plan-apply)
- Providers
- Resources
- Variables
- Resource dependencies (implicit & explicit)
- Provisioners
- Modules
- Terraform registry

## Authenticate to Azure

- Create a SPN using the below and use a bash script to set the env vars

```bash
az account show --query "{subscriptionId:id, tenantId:tenantId}"
az account set --subscription="${SUBSCRIPTION_ID}"
az ad sp create-for-rbac --role="Contributor" --scopes="/subscriptions/${SUBSCRIPTION_ID}"
```

Use below bash or setup.ps1 (placed in the repo).

```bash
#!/bin/sh
echo "Setting environment variables for Terraform"
export ARM_SUBSCRIPTION_ID=your_subscription_id
export ARM_CLIENT_ID=your_appId
export ARM_CLIENT_SECRET=your_password
export ARM_TENANT_ID=your_tenant_id

# Not needed for public, required for usgovernment, german, china
export ARM_ENVIRONMENT=public
```

- Use CloudShell

## Import of existing resources

Create empty resource block as in (import.tf file)

```powershell
terraform import azurerm_resource_group.cloudshellrg /subscriptions/$env:ARM_SUBSCRIPTION_ID/resourceGroups/cloud-shell-storage-southeastasia
```

```powershell
terraform import azurerm_resource_group.testrg /subscriptions/$env:ARM_SUBSCRIPTION_ID/resourceGroups/tf-import-rg
```

After above steps, do a terraform show and terraform validate.
Terraform will ask you to populate required attributes for the resource.

## Create an Azure resources

Create the resource group.

```bash
resource "azurerm_resource_group" "myterraformgroup" {
    name     = "myfirstTerraformResourceGroup"
    location = "eastus"

    tags {
        environment = "Terraform Demo"
    }
}
```

Create the virtual network and subnet

```bash
resource "azurerm_virtual_network" "myterraformnetwork" {
    name                = "myVnet"
    address_space       = ["10.0.0.0/16"]
    location            = "eastus"
    resource_group_name = "${azurerm_resource_group.myterraformgroup.name}" # Note how we ref

    tags {
        environment = "Terraform Demo"
    }
}

resource "azurerm_subnet" "myterraformsubnet" {
    name                 = "mySubnet"
    resource_group_name  = "${azurerm_resource_group.myterraformgroup.name}"
    virtual_network_name = "${azurerm_virtual_network.myterraformnetwork.name}"
    address_prefix       = "10.0.2.0/24"
}
```

## Format the Terraform files

```powershell
terraform fmt # this would auto-format all the .tf files in the current dir
```