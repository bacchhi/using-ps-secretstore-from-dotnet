#Install-Module -Name Microsoft.PowerShell.SecretStore -Repository PSGallery -Force
#Install-Module -Name Microsoft.PowerShell.SecretManagement -Repository PSGallery -Force
Import-Module Microsoft.PowerShell.SecretManagement
Import-Module Microsoft.PowerShell.SecretStore

$credential = Get-Credential -UserName 'MyAppSecureStore'

$securePasswordPath = 'd:\automation\passwd.xml'
$credential.Password |  Export-Clixml -Path $securePasswordPath

$storeConfiguration = @{
    Authentication = 'Password'
    PasswordTimeout = 3600 #1 hour
    Interaction = 'None'
    Password = $credential.Password
    Confirm = $false
}

Set-SecretStoreConfiguration @storeConfiguration

Register-SecretVault -Name MyAppSecretStore -ModuleName Microsoft.PowerShell.SecretStore -DefaultVault
