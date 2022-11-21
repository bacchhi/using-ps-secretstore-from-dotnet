Import-Module Microsoft.PowerShell.SecretManagement
Import-Module Microsoft.PowerShell.SecretStore

$securePasswordPath = 'd:\automation\passwd.xml'
$password = Import-CliXml -Path $securePasswordPath

Unlock-SecretStore -Password $password

Set-Secret -Name Conn -Secret "secreto" -Vault MyAppSecretStore