$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$fileLocation = Join-Path $toolsDir 'Pastel.exe'

$packageArgs = @{
  packageName   = 'pastel'
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  file          = $fileLocation
  softwareName  = 'Japplis Pastel*'
  checksum      = '54486387ae6ea6abd92decc093650e56e00547e26e99f782bc184be691b95a05'
  checksumType  = 'sha256'
  silentArgs    = "/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /LOG=`"$($env:TEMP)\$($env:chocolateyPackageName).$($env:chocolateyPackageVersion).InnoInstall.log`""
  validExitCodes= @(0,3010,1641)
}

Install-ChocolateyInstallPackage @packageArgs
