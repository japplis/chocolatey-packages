$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$fileLocation = Join-Path $toolsDir 'AntCommander.exe'

$packageArgs = @{
  packageName   = 'ant-commander'
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  file          = $fileLocation
  softwareName  = 'Ant Commander Personal*'
  checksum      = '9e7191e80daa397f0f580f156d57d3c12712a036424fd5acf4d4676994c817a9'
  checksumType  = 'sha256'
  silentArgs    = "/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /LOG=`"$($env:TEMP)\$($env:chocolateyPackageName).$($env:chocolateyPackageVersion).InnoInstall.log`""
  validExitCodes= @(0,3010,1641)
}

Install-ChocolateyInstallPackage @packageArgs
