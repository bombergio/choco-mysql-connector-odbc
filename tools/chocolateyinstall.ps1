$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://cdn.mysql.com//Downloads/Connector-ODBC/8.0/mysql-connector-odbc-8.0.28-win32.msi'
$url64      = 'https://cdn.mysql.com//Downloads/Connector-ODBC/8.0/mysql-connector-odbc-8.0.28-winx64.msi'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'msi'
  url           = $url
  url64bit      = $url64

  softwareName  = 'mysql odbc driver *'

  checksum      = '4f2669887b3531846d2416212263ef096332c0443a6166770bae13fe6afb69e7'
  checksumType  = 'sha256'
  checksum64    = '47d0db0b4a4aecd75a75776bfe58eb77eed82f77b8e11ca78ec4ec1a4d69527d'
  checksumType64= 'sha256'

  silentArgs    = "/qn"
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
