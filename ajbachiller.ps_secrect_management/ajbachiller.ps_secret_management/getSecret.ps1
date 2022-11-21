#Install-Module -Name Microsoft.PowerShell.SecretStore -Repository PSGallery -Force
#Install-Module -Name Microsoft.PowerShell.SecretManagement -Repository PSGallery -Force
Import-Module Microsoft.PowerShell.SecretManagement
Import-Module Microsoft.PowerShell.SecretStore

$securePasswordPath = 'd:\automation\passwd.xml'
$password = Import-CliXml -Path $securePasswordPath

Unlock-SecretStore -Password $password
$Conn = Get-Secret -Name Conn -AsPlainText
#Get-Secret -Name Conn -AsPlainText

#Write-Output $Conn
#Write-Host $Conn

Out-String -InputObject $Conn -Stream

#$StandardString = ConvertFrom-SecureString $Conn
#Out-String -InputObject $StandardString -Stream

