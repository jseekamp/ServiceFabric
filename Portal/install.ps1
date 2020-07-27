function Uninstall() {
    Write-Host "Uninstalling App as installation failed... Please try installation again."
    Invoke-Expression "& $PSScriptRoot\uninstall.ps1"
    Exit
}

Connect-ServiceFabricCluster

$AppPath = "$PSScriptRoot\Portal"
Copy-ServiceFabricApplicationPackage -ApplicationPackagePath $AppPath -ApplicationPackagePathInImageStore Portal -ShowProgress
if (!$?) {
    Uninstall
}

Register-ServiceFabricApplicationType Portal
if (!$?) {
    Uninstall
}

New-ServiceFabricApplication fabric:/Portal PortalType 1.0.0
if (!$?) {
    Uninstall
}