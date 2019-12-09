[cmdletbinding()]
Param($Path)

$ChildItem = Get-ChildItem -Path $Path  -Directory

$Length = $ChildItem | Get-Item | Select-Object -ExpandProperty Length

$Length | Measure-Object -Sum | Select-Object -ExpandProperty Sum