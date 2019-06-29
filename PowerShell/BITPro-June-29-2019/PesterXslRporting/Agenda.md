
# Pester with built-in UI reporting and Suggestions


### $MySelf

      Just another PowerShell fan

  >- Prasoon Karunan V

  >- Software Technologist @ Philips

  >- Moderator @ [PowerShell.org](www.powershell.org)

  >- Volunteer @ [The DevOps Collective](www.DevopsCollective.org)

  >- [@prasoonkaruanan](twitter.com/prasoonkarunan)

  >- <a href="https://stackoverflow.com/users/4980370/prasoon-karunan-v"><img src="https://stackoverflow.com/users/flair/4980370.png"></a>

  >- [github.com/kvprasoon](github.com/kvprasoon)

  >- PowerShell Community Hero 2019



Link to the branch with the changes [here](https://github.com/kvprasoon/Pester/tree/remark)


##  Demo

```
#Import the modified pester module
Import-Module C:\Users\kvprasoon\Documents\GitHub\Pester\Pester.psd1 -Force

# Execute the pester script as usual by generating nunit xml report.
Invoke-Pester -Script C:\Users\kvprasoon\Documents\GitHub\Demo\PesterXslRporting\OpsValidation.tests.ps1 -OutputFile C:\temp\OpsValidationReport.xml  -OutputFormat NUnitXml

# Open the nunit report in web browser
Start-Process iexplore C:\Temp\OpsValidationReport.xml
```

* Execute the pester script as usual by generating nunit xml report, this time with the xsl file

```
Invoke-Pester -Script C:\Users\kvprasoon\Documents\GitHub\Demo\PesterXslRporting\OpsValidation.tests.ps1 -OutputFile C:\temp\OpsValidationReport.xml  -OutputFormat NUnitXml  -XSLPath C:\Users\kvprasoon\Documents\GitHub\Demo\PesterXslRporting\Pester.xsl

#Open the nunit report in web browser
Start-Process iexplore C:\Temp\OpsValidationReport.xml
```

* Execute the pester script as usual by generating nunit xml report, this time with the xsl file and the test script with -Remarks used.

```
Invoke-Pester -Script C:\Users\kvprasoon\Documents\GitHub\Demo\PesterXslRporting\OpsValidation-Remark.tests.ps1 -OutputFile C:\temp\OpsValidationReport.xml  -OutputFormat NUnitXml  -XSLPath C:\Users\kvprasoon\Documents\GitHub\Demo\PesterXslRporting\Pester.xsl

#Open the nunit report in web browser
Start-Process iexplore C:\Temp\OpsValidationReport.xml
```