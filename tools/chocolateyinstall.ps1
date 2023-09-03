$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64 = 'https://cdn.mysql.com//Downloads/Connector-ODBC/8.1/mysql-connector-odbc-8.1.0-winx64.msi'

$packageArgs = @{
  packageName = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType = 'msi'
  url64bit = $url64

  softwareName = 'mysql odbc driver *'

  checksum64 = '69ec7a4c73c8ecb6d0a800a24c339bdde9e6600d71547bf47974ac6b495fa250'
  checksumType64 = 'sha256'

  silentArgs = "/qn"
  validExitCodes = @(0)
}

if (-not ([System.Environment]::Is64BitOperatingSystem)) {
  throw "This package requires a 64-bit version of Windows."
}

Install-ChocolateyPackage @packageArgs
