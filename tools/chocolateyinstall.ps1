$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64 = 'https://cdn.mysql.com//Downloads/Connector-ODBC/26.10/mysql-connector-odbc-26.10.0-winx64.msi'

$packageArgs = @{
  packageName = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType = 'msi'
  url64bit = $url64

  softwareName = 'mysql odbc driver *'

  checksum64 = 'ac58d7f1b4d7c1f37630a78c83c659f04c127754bfa299957b4effa32bd83cae'
  checksumType64 = 'sha256'

  silentArgs = "/qn"
  validExitCodes = @(0)
}

if (-not ([System.Environment]::Is64BitOperatingSystem)) {
  throw "This package requires a 64-bit version of Windows."
}

Install-ChocolateyPackage @packageArgs
