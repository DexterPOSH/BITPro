## Create Service Principal
$DemoSP = New-AzADServicePrincipal -DisplayName DemoBITPro -Role Reader
 
# Login using service principal
$TenantId = '<tenant id>'
$ApplicationId = '<application id>'
$Secret = '<sp secret>'
$Credential = [PSCredentials]::New($ApplicationId, $Secret)
Connect-AzAccount -ServicePrincipal -Credential $Credential -TenantId $TenantId
