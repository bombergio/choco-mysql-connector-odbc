$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://cdn.mysql.com//Downloads/Connector-ODBC/8.0/mysql-connector-odbc-8.0.32-win32.msi'
$url64 = 'https://cdn.mysql.com//Downloads/Connector-ODBC/8.0/mysql-connector-odbc-8.0.32-winx64.msi'

$packageArgs = @{
  packageName = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType = 'msi'
  url = $url
  url64bit = $url64

  softwareName = 'mysql odbc driver *'

  checksum = '51edbc90abdecc8543aa6462486d51880886fafba98ba9d06ea058d8e8a5be88'
  checksumType = 'sha256'
  checksum64 = 'f10581c0feec2159fe8158eab4580f77c783d86aeaf4b6071a7e6bc971a7927e'
  checksumType64 = 'sha256'

  silentArgs = "/qn"
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
