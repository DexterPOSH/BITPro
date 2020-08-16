# List all the Azure PowerShell Module
Get-Module -Name Az.* -ListAvailable
 
# List the cmdlets in a specific module
Get-Command -Module Az.Resources
 
# Filter the cmdlets by verb or/and noun
Get-Command -Verb Get -Module Az.Resources
Get-Command -Verb Get -Noun *VM -Module Az.Compute 
Get-Command -Name *LoadBalancer* -Module Az.Network
<# Available Verbs in Az Module
Add, Clear, Disable, Edit, Enable, Export, Get, Import, Invoke, Join, List, Login, Logout, Move, New, 
Reactivate, Remove, Repair, Reset, Resolve, Restart, Restore, Resume, Save, Select, Set, Start, Stop, 
Submit, Suspend, Swap, Sync, Test, Update, Use, Validate, Wait, Disconnect, Register, Send, Unregister, 
Approve, Backup, Close, Complete, Confirm, Connect, Convert, ConvertTo, Deny, Enter, Grant, Initialize, 
Install, Lock, Publish, Rename, Resize, Revoke, Switch, Undo, Uninstall, Unpublish
#>
 
# Get help
Get-Help -Name New-AzVirtualNetwork # -Detailed, -Full, -Examples and -Online
 
# Get object members
$VM = Get-AzVm -ResourceGroup test-rg -Name TestVM
$VM | Get-Member