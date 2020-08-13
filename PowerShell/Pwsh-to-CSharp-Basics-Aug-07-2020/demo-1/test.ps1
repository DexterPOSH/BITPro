using namespace System.Net;
using module ./Computer.psm1
using assembly '/usr/local/microsoft/powershell/7/System.DirectoryServices.dll'
using namespace System.DirectoryServices.ActiveDirectory

[IPAddress] $IP = "10.10.10"
$IP

$Computer = [Computer]::new("test1vm")
$Computer

Domain.

$myDomain = [myDirectoryClass]::new([DirectoryContextType]::Domain)
$myDomain