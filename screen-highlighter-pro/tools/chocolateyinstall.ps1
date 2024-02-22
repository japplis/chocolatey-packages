$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$fileLocation = Join-Path $toolsDir 'ScreenHighlighterPro.exe'

$packageArgs = @{
  packageName   = 'screen-highlighter-pro'
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  file          = $fileLocation
  softwareName  = 'Screen Highlighter Pro*'
  checksum      = '9a2fa89505a35bbd6b7356a1900589e0a9976ebe400e41946cfdd0de140a830c'
  checksumType  = 'sha256'
  silentArgs    = "/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /LOG=`"$($env:TEMP)\$($env:chocolateyPackageName).$($env:chocolateyPackageVersion).InnoInstall.log`""
  validExitCodes= @(0,3010,1641)
}

Install-ChocolateyInstallPackage @packageArgs
