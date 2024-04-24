$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$fileLocation = Join-Path $toolsDir 'VRPhotoConverter.exe'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  file          = $fileLocation
  softwareName  = 'VR Photo Converter*'
  checksum      = '8c414aaf904ffe2ce579c7bc0861dee91c4ec8e5e488b0ff50c3fb2c7411aca0'
  checksumType  = 'sha256'
  silentArgs    = "/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /LOG=`"$($env:TEMP)\$($env:chocolateyPackageName).$($env:chocolateyPackageVersion).InnoInstall.log`""
  validExitCodes= @(0, 1641, 3010)
}

Install-ChocolateyInstallPackage @packageArgs
