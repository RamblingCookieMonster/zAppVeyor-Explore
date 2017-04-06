# Grab nuget bits
Get-PackageProvider -Name NuGet -ForceBootstrap | Out-Null

# Some CI/CD helper functions, set up some env variables
Install-Module BuildHelpers -Force
Import-Module BuildHelpers
Set-BuildEnvironment

# Look around
Get-BuildEnvironmentDetail -KillKittens
