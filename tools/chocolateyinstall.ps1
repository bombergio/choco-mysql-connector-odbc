$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://cdn.mysql.com//Downloads/Connector-ODBC/8.0/mysql-connector-odbc-8.0.31-win32.msi'
$url64      = 'https://cdn.mysql.com//Downloads/Connector-ODBC/8.0/mysql-connector-odbc-8.0.31-winx64.msi'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'msi'
  url           = $url
  url64bit      = $url64

  softwareName  = 'mysql odbc driver *'

  checksum      = '2b5e19122823c835e7a2a9e7aaafc7720ba5cd67517a19b623bd756b862d5060'
  checksumType  = 'sha256'
  checksum64    = 'e75f2a9b0b31abe7c803f5aaa9031d838e55652a12c12550ed45758d844cdd48'
  checksumType64= 'sha256'

  silentArgs    = "/qn"
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
