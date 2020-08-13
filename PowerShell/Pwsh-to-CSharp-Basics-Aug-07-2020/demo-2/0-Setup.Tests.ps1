$Path = 'D:\BITPro\PowerShell\Pwsh-to-CSharp-Basics-Aug-07-2020\demo-2'
Set-Location $Path -ErrorAction SilentlyContinue

Clear-Host
Describe "Setup" {
    it 'Check PowerShell v7' {
        $PSVersionTable.PSVersion.Major -eq 7 | Should be $true
    }    
    it 'Check current working directory' {
        (Get-Location).Path -eq $Path | Should be $true
    }
}
