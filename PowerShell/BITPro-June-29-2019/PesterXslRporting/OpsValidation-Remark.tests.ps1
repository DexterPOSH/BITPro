param(
    [Parameter(Mandatory = $False)]
    [string]$ConfigPath = 'C:\Users\kvprasoon\Documents\GitHub\Demo\Pester++\OpsValidation.config.json'
)

$Config = Get-Content -Path $ConfigPath | ConvertFrom-Json

Describe "Describing validation tests post deployment" {
    Context "Post deployment validation tests for services" {
        BeforeAll {
            $Config.service.expectedconfiguration | ForEach-Object -Process {

                $Name = $_.Name
                $Status = $_.Status
                $StartMode = $_.StartMode
                $Service =  Get-Service -Name $Name

                it "Service $Name status should be $Status" {
                    $Service.Status | Should -Be $Status
                } -Remark ($Config.Service.suggestion.status -f $Name,$Status)

                it "Service $Name startmode should be $StartMode" {
                    $Service.StartType | Should -Be $StartMode
                } -Remark ($Config.Service.suggestion.startmode -f $Name,$StartMode)
            }
        }
    }

    Context "Post deployment validation tests for folder permission" {

        $Config.folderpermission.expectedconfiguration | ForEach-Object -Process {

            $User = $_.user
            $Permission = $_.permission
            $Path = $_.path

            it "user $User should have $Permission permission on path $Path" {
                $Access = (Get-Acl -Path $Path).Access | WHere-Object -FilterScript {$_.IdentityReference -eq $User}
                $Access.FileSystemRights | Should -Contain $Permission
            } -Remark ($Config.folderpermission.suggestion.message -f $Permission,$User,$Path)
        }
    }

    Context "Post deployment validation tests for firewall rule" {

        $Config.firewallrule.expectedconfiguration | ForEach-Object -Process {

            $Rulename = $_.rulename
            $Direction = $_.direction
            $Rule = Get-NetFirewallRule -Name $RuleName -ErrorAction SilentlyContinue

            it "A Firewall rule with name $RuleName should be available" {
                $Rule | Should -Not -BeNullOrEmpty
            } -Remark ($Config.firewallrule.suggestion.rulename -f $Direction,$Rulename)

            it "Firewall rule $RuleName should be allowed for $Direction connection" {
                $Rule.Direction | Should -Not $Direction
            } -Remark ($Config.firewallrule.suggestion.direction -f $Rulename,$Direction)
        }
    }
}