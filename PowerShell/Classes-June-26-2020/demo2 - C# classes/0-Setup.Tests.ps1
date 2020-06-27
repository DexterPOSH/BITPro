$Path = 'D:\BITPro\PowerShell\Classes-June-26-2020\demo2 - C# classes'
Set-Location $Path -ErrorAction SilentlyContinue
Remove-Item $Path\MyApp\ -Force -Recurse -ErrorAction SilentlyContinue

Clear-Host
Describe "Setup" {
    it 'Check PowerShell v7' {
        $PSVersionTable.PSVersion.Major -eq 7 | Should be $true
    }    
    it 'Check current working directory' {
        (Get-Location).Path -eq $Path | Should be $true
    }
    it  "Remove unwanted projects" {
        Test-Path $Path\MyApp\ | Should be $false
    }
}
