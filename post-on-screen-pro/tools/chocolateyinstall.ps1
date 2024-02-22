$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$fileLocation = Join-Path $toolsDir 'PostOnScreenPro.exe'

$packageArgs = @{
  packageName   = 'post-on-screen-pro'
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  file          = $fileLocation
  softwareName  = 'Post On Screen Pro*'
  checksum      = 'd35fbe7151e560bc16c0029b28e0ffb587fdeaf878253257cd5330a315cf7d8d'
  checksumType  = 'sha256'
  silentArgs    = "/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /LOG=`"$($env:TEMP)\$($env:chocolateyPackageName).$($env:chocolateyPackageVersion).InnoInstall.log`""
  validExitCodes= @(0,3010,1641)
}

Install-ChocolateyInstallPackage @packageArgs
