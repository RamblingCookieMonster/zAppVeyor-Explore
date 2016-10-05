# Grab nuget bits
Get-PackageProvider -Name NuGet -ForceBootstrap | Out-Null

# Some CI/CD helper functions, set up some env variables
Install-Module BuildHelpers -Force
Import-Module BuildHelpers
Set-BuildEnvironment

# Display some details about the environment!
$lines = '----------------------------------------------------------------------'

"$lines`nPSVERSIONTABLE`n`n"
$PSVersionTable

"`n`n$lines`nBUILDHELPERS`n`n"
Get-Item ENV:BH*

"`n`n$lines`nMODULES`n`n"
Get-Modules -ListAvailable |
    Select Name, Version, Path |
    Sort Name

"`n`n$lines`nENV`n`n"
Get-ChildItem ENV:

"`n`n$lines`nPSMODULEPATH`n`n"
$ENV:PSModulePath -Split ";"

"`n`n$lines`nPATH`n`n"
$ENV:PATH -Split ";"

"`n`n$lines`nVARIABLES`n`n"
Get-Variable
