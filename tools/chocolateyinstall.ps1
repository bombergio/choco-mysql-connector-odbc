$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64 = 'https://cdn.mysql.com//Downloads/Connector-ODBC/9.2/mysql-connector-odbc-9.2.0-winx64.msi'

$packageArgs = @{
  packageName = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType = 'msi'
  url64bit = $url64

  softwareName = 'mysql odbc driver *'

  checksum64 = '73a47c4a74e478ec12594eb6ca858dee94f5bc67f1458db7ab93e5f68d4f7eec'
  checksumType64 = 'sha256'

  silentArgs = "/qn"
  validExitCodes = @(0)
}

if (-not ([System.Environment]::Is64BitOperatingSystem)) {
  throw "This package requires a 64-bit version of Windows."
}

Install-ChocolateyPackage @packageArgs
