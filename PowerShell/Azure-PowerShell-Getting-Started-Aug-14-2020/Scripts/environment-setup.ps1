## Open Windows PowerShell as administrator, and run the commands below...
# Install Chocolatey package manager
Set-ExecutionPolicy Bypass -Scope Process -Force
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072 
Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

# Install PowerShell 7
choco install powershell-core -y

# Install Windows Terminal
choco install microsoft-windows-terminal -y

# Install Visual Studio Code
choco install vscode -y


## Open PowerShell 7 or Windows Terminal (PowerShell 7 Tab) as administrator
# Install Azure PowerShell using choco
choco install az.powershell -y
# or install using the Install-Module
Install-Module -Name Az -Force
#########
# NOTE: When you are updating the module use the same mode of the installation. 
#       If it is choco then use upgrade switch or if it is Install-Module then use Update-Module itself.
#########

# Install PowerShell extension for Visual Studio Code using choco
choco install vscode-powershell -y
# or using code itself 
code --install-extension ms-vscode.powershell

# Install Azure Account extension for Visual Studio Code
code --install-extension ms-vscode.azure-account

# Install NodeJS to launch Azure Cloud Shell in VSCode
choco install nodejs -y


### Additional software
## Install Google Chrome or Microsoft EDGE
# Google Chrome
choco install googlechrome -y
# Microsoft EDGE
choco install microsoft-edge -y

# Install git scm
choco install git -y
