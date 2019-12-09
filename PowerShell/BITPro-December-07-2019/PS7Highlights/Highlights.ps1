
#region Negative Splits

    $String = 'a b c d,e,d'

    #Existing options for splitting
    # normal split
        $String -split ' '

    # conditional split with scriptblock
        $String -split {$_ -eq ' ' -or $_ -eq ','}
        $String -split ' |,' # using regex

    # max substrings split
        $String -split ' ', 3

    # max substrings -ive split
        $String -split ' ', -3


#endregion


#region History duration
    Get-History

    Get-History | Select-Object -First 1 | Format-List *
#endregion


#region Line continuation
    # Wrapping with a pipe at the end of a line
    Get-Process | Where-Object -FilterScript {$_.Path} |
        Get-Item | Where-Object -FilterScript {$_.FullName -match "AppData"} |
        Sort-Object -Property FullName -Unique

    # Wrapping with a backtick at the end of a line and a pipe at the beginning of a line
    Get-Process | Where-Object -FilterScript {$_.Path} `
        | Get-Item | Where-Object -FilterScript {$_.FullName -match "AppData"} `
        | Sort-Object -Property FullName -Unique

    # Wrapping with a pipe at the beginning of a line (no backtick required)
    Get-Process | Where-Object -FilterScript {$.Path}
        | Get-Item | Where-Object -FilterScript {$_.FullName -match "AppData"}
        | Sort-Object -Property FullName -Unique
#endregion


#region Foreach parallel
    Measure-Command -Expression {1..10 | ForEach-Object -Process {Write-Host  "number $_" ; Start-Sleep -Seconds 1}}

    Measure-Command -Expression {1..10 | ForEach-Object -Parallel {Write-Host  "number $_" ; Start-Sleep -Seconds 1}}

    Measure-Command -Expression {1..10 | ForEach-Object -Parallel  {Write-Host  "number $_" ; Start-Sleep -Seconds 1} -ThrottleLimit 10}

    # Very detailed blog post: https://devblogs.microsoft.com/powershell/powershell-foreach-object-parallel-feature/
#endregion


#region Ternary operator
    $a = 5
    $b = 10

    # The old way
    if($a -gt $b){
        'a is greater than b'
    }
    else{
        'b is greater than a'
    }

    #or

    if($a -lt $b){
        'b is greater than a'
    }
    else{
        'a is greater than b'
    }

    # Using Ternary operator
    # condition ? iftrue : else
    $a -gt $b ? 'a is greater than b' : 'b is greater than a'

    $a -lt $b ? 'b is greater than a' : 'a is greater than b'
#endregion


#region Erroraction Break
    .\script1.ps1 -Path c:\Temp

    .\script1.ps1 -Path c:\Temp -ErrorAction Break
#endregion


#region Pipeline chain operators
    # Last execeution status
    $?

    # Existing approach
    if($?){
        'if previous execution is successful, then do something'
    }
    else{
        'do nothing'
    }

    # Chain operators && and ||
    ($Output = Get-Process -Name pwsh) && "$($Output.Count) pwsh found" # execute if previsous exec is success

    ($Output = Get-Process -Name blah) && "$($Output.Count) blah found" # doesn't execute if previsous exec fails

    ($Output = Get-Process -Name blah) || "No blah found" # execute if previsous exec is failure

    ($Output = Get-process -Name blah) && "$($Output.Count) blah found" || "No blah found"

    ($Output = Get-Process -Name pwsh) && "$($Output.Count) pwsh found" || "No pwsh found"
#endregion


#region Null conditional and assignment operator
    $Value = $null

    # Existing appraoch for Null condition check
    if($null -eq $Value){
        'Value is null'
    }

    $Value ?? 'Value is null'

    # Existing appraoch for Null condition check and assignment
    "Value is before check is $Value"
    if($null -eq $Value){
        $Value = 1
        "Value is now $Value"
    }

    $Value = $null

    "Value is before check is $Value"
    $Value ??= 1

    "Value is now $Value"
#endregion


#region Tab completion for variable assignments
    $ErrorActionPreference = 'Stop'
#endregion


#region New version notification
    start-Process -FilePath 'C:\Users\kvprasoon\Downloads\PowerShell-7.0.0-preview.5-win-x64\pwsh.exe'
#endregion


#region Error view and Get-Error cmdlet
    $ErrorView # new error view variable
    Get-Process foo

    $ErrorView = 'CategoryView'
    Get-Process foo

    $ErrorView = 'NormalView'
    Get-Process foo

    Get-Error -Newest
#endregion


#region Null conditional member accessing and indexing
    $NoValue = $null

    # Member access on a null value
        $NoValue.Open()
        if($null -ne $NoValue){
            $NoValue.Open()
        }
        # Null conditional Member access
        ${NoValue}?.Open()

    # Indexing on a null value
        $NoValue = $null
        $NoValue[1]
        if($null -ne $NoValue){
            $NoValue[2]
        }

        # Null conditional indexing
        ${NoValue}?[1]

        $NoValue = 1,2,3
        ${NoValue}?[1]
#endregion


#region -SecurityDescriptorSddl parameter for Set and New Service cmdlets


New-Service -Name TestService -SecurityDescriptorSddl 'D:(A;;CCLCSWLOCRRC;;;SU)(A;;CCLCSWRPWPDTLOCRRC;;;SY)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;BA)' -BinaryPathName c:\windows\system32\cmd.exe
sc.exe sdshow testservice

Set-Service -Name TestService -SecurityDescriptorSddl 'D:(A;;CCLCSWLOCRRC;;;SU)(D;;CCLCSWRPWPDTLOCRRC;;;SY)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;BA)'
#endregion
