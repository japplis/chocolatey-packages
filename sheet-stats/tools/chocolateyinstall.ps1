$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$fileLocation = Join-Path $toolsDir 'SheetStats.exe'

$packageArgs = @{
  packageName   = 'sheet-stats'
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  file          = $fileLocation
  softwareName  = 'Sheet Stats*'
  checksum      = '8f46ca5f4eeacabf0fafd4fc4fd30c9c3a2e8b3460bac5389cb8e9999ddfc235'
  checksumType  = 'sha256'
  silentArgs    = "/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /LOG=`"$($env:TEMP)\$($env:chocolateyPackageName).$($env:chocolateyPackageVersion).InnoInstall.log`""
  validExitCodes= @(0,3010,1641)
}

Install-ChocolateyInstallPackage @packageArgs
