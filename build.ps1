# Grab nuget bits
Get-PackageProvider -Name NuGet -ForceBootstrap | Out-Null

# Some CI/CD helper functions, set up some env variables
Install-Module BuildHelpers -Force
Import-Module BuildHelpers
Set-BuildEnvironment

# Display some details about the environment!
$lines = '----------------------------------------------------------------------'

"$lines`nPSVERSIONTABLE`n`n"
$PSVersionTable |
    Out-Host

"`n`n$lines`nBUILDHELPERS`n`n"
Get-Item ENV:BH* |
    Out-Host

"`n`n$lines`nMODULES`n`n"
Get-Module -ListAvailable |
    Select Name, Version, Path |
    Sort Name |
    Out-Host

"`n`n$lines`nENV`n`n"
Get-ChildItem ENV: |
    Out-Host

"`n`n$lines`nPSMODULEPATH`n`n"
$ENV:PSModulePath -Split ";" |
    Out-Host

"`n`n$lines`nPATH`n`n"
$ENV:PATH -Split ";" |
    Out-Host

"`n`n$lines`nVARIABLES`n`n"
Get-Variable |
    Out-Host
