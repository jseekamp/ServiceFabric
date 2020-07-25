Param(
  [Parameter(Mandatory=$true)]
  [string]$version
)

$AppPath = "$PSScriptRoot\Portal"
Copy-ServiceFabricApplicationPackage -ApplicationPackagePath $AppPath -ApplicationPackagePathInImageStore "Portal\$version" -ShowProgress
Register-ServiceFabricApplicationType -ApplicationPathInImageStore "Portal\$version"
Start-ServiceFabricApplicationUpgrade -ApplicationName fabric:/Portal -ApplicationTypeVersion $version -FailureAction Rollback -Monitored