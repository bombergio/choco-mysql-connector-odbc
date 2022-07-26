$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://cdn.mysql.com//Downloads/Connector-ODBC/8.0/mysql-connector-odbc-8.0.30-win32.msi'
$url64      = 'https://cdn.mysql.com//Downloads/Connector-ODBC/8.0/mysql-connector-odbc-8.0.30-winx64.msi'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'msi'
  url           = $url
  url64bit      = $url64

  softwareName  = 'mysql odbc driver *'

  checksum      = 'be060d2fda51e02f65eb1462abb84d8ffe2edba75601da9cd0945b00851f75d9'
  checksumType  = 'sha256'
  checksum64    = '4a7f6a2248e0b8d6ed2142978e4c60a0a09c11215bdec74cce5a697e4958e09a'
  checksumType64= 'sha256'

  silentArgs    = "/qn"
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
