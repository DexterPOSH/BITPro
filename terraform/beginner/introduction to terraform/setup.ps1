write-Host "Setting environment variables for Terraform"
 $env:ARM_SUBSCRIPTION_ID="<place subscription id>"
 $env:ARM_CLIENT_ID="<place application id>"
 $env:ARM_CLIENT_SECRET="<place application secret>"
 $env:ARM_TENANT_ID="<place the tenant id>"

# Not needed for public, required for usgovernment, german, china
 $env:ARM_ENVIRONMENT="public"

# Pouplate the Subcription ID var

