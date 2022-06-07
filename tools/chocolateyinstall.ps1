$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://cdn.mysql.com//Downloads/Connector-ODBC/8.0/mysql-connector-odbc-8.0.29-win32.msi'
$url64      = 'https://cdn.mysql.com//Downloads/Connector-ODBC/8.0/mysql-connector-odbc-8.0.29-winx64.msi'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'msi'
  url           = $url
  url64bit      = $url64

  softwareName  = 'mysql odbc driver *'

  checksum      = '549034e783afa1accdf54721961bc8f74e8bf36cf0d7e6b95d0cd8f18231599f'
  checksumType  = 'sha256'
  checksum64    = '41cff009f9c805da61b43311f8f09f4545afc1dac8e4ed43d68397135e623af8'
  checksumType64= 'sha256'

  silentArgs    = "/qn"
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
