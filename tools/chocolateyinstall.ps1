$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://cdn.mysql.com//Downloads/Connector-ODBC/8.0/mysql-connector-odbc-8.0.33-win32.msi'
$url64 = 'https://cdn.mysql.com//Downloads/Connector-ODBC/8.0/mysql-connector-odbc-8.0.33-winx64.msi'

$packageArgs = @{
  packageName = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType = 'msi'
  url = $url
  url64bit = $url64

  softwareName = 'mysql odbc driver *'

  checksum = '7320329a81ae5cfe2e5a62213c59ffa9055672924b58561b4ff377a8ef7c3291'
  checksumType = 'sha256'
  checksum64 = '3157a5e58233cdd66230bf077c18965d7d896508ee0b70e9780774cafe5d790b'
  checksumType64 = 'sha256'

  silentArgs = "/qn"
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
