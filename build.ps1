# Grab nuget bits
Get-PackageProvider -Name NuGet -ForceBootstrap | Out-Null

# Some CI/CD helper functions, set up some env variables
Install-Module BuildHelpers
Import-Module BuildHelpers
Set-BuildEnvironment

# Display some details about the environment!
$lines = '----------------------------------------------------------------------'

"$lines`PSVERSIONTABLE`n`n"
$PSVersionTable

"`n`n$lines`BUILDHELPERS`n`n"
Get-Item ENV:BH*

"`n`n$lines`MODULES`n`n"
Get-Modules -ListAvailable |
    Select Name, Version, Path |
    Sort Name

"`n`n$linesENV`n`n"
Get-ChildItem ENV:

"`n`n$lines`PSMODULEPATH`n`n"
$ENV:PSModulePath -Split ";"

"`n`n$lines`PATH`n`n"
$ENV:PATH -Split ";"

"`n`n$lines`VARIABLES`n`n"
Get-Variable

