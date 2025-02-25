Import-Module ActiveDirectory

Remove-ADUser -Identity "Jon" -Confirm:$false
Remove-ADUser -Identity "Terry" -Confirm:$false

$password = ConvertTo-SecureString -AsPlainText "Pa55w.rd" -Force

New-ADUser -GivenName "Paul" -Surname "Koch" -Name "Paul Koch" -DisplayName "Paul Koch" -City "London" -Country "GB" -UserPrincipalName "Paul@Adatum.com" -SamAccountName "Paul" -PasswordNeverExpires $true -Department "Sales" -Company "Adatum" -Path "OU=Sales,DC=Adatum,DC=com" -AccountPassword $password -Enabled $true
Add-ADGroupMember -Identity Sales -Members Paul
New-ADUser -GivenName "Mike" -Surname "Ray" -Name "Mike Ray" -DisplayName "Mike Ray" -City "London" -Country "GB" -UserPrincipalName "Mike@Adatum.com" -SamAccountName "Mike" -PasswordNeverExpires $true -Department "IT" -Company "Adatum" -Path "OU=IT,DC=Adatum,DC=com" -AccountPassword $password -Enabled $true
Add-ADGroupMember -Identity IT -Members Mike
New-ADUser -GivenName "Briana" -Surname "Hernandez" -Name "Briana Hernandez" -DisplayName "Briana Hernandez" -City "Seattle" -Country "US" -UserPrincipalName "Briana@Adatum.com" -SamAccountName "Briana" -PasswordNeverExpires $true -Department "IT" -Company "Adatum" -Path "OU=IT,DC=Adatum,DC=com" -AccountPassword $password -Enabled $true
Add-ADGroupMember -Identity IT -Members Briana
New-ADUser -GivenName "Bruce" -Surname "Keever" -Name "Bruce Keever" -DisplayName "Bruce Keever" -City "London" -Country "GB" -UserPrincipalName "Bruce@Adatum.com" -SamAccountName "Bruce" -PasswordNeverExpires $true -Department "Marketing" -Company "Adatum" -Path "OU=Marketing,DC=Adatum,DC=com" -AccountPassword $password -Enabled $true
Add-ADGroupMember -Identity Marketing -Members Bruce
New-ADUser -GivenName "Ben" -Surname "Miller" -Name "Ben Miller" -DisplayName "Ben Miller" -City "Seattle" -Country "US" -UserPrincipalName "Ben@Adatum.com" -SamAccountName "Ben" -PasswordNeverExpires $true -Department "Sales" -Company "Adatum" -Path "OU=Sales,DC=Adatum,DC=com" -AccountPassword $password -Enabled $true
Add-ADGroupMember -Identity Sales -Members Ben
New-ADUser -GivenName "Cari" -Surname "Dick" -Name "Cari Dick" -DisplayName "Cari Dick" -City "London" -Country "GB" -UserPrincipalName "Cari@Adatum.com" -SamAccountName "Cari" -PasswordNeverExpires $true -Department "Marketing" -Company "Adatum" -Path "OU=Marketing,DC=Adatum,DC=com" -AccountPassword $password -Enabled $true
Add-ADGroupMember -Identity Marketing -Members Cari
New-ADUser -GivenName "Davy" -Surname "Vliegen" -Name "Davy Vliegen" -DisplayName "Davy Vliegen" -City "London" -Country "GB" -UserPrincipalName "Davy@Adatum.com" -SamAccountName "Davy" -PasswordNeverExpires $true -Department "Research" -Company "Adatum" -Path "OU=Research,DC=Adatum,DC=com" -AccountPassword $password -Enabled $true
Add-ADGroupMember -Identity Research -Members Davy
New-ADUser -GivenName "Scott" -Surname "Brown" -Name "Scott Brown" -DisplayName "Scott Brown" -City "London" -Country "GB" -UserPrincipalName "Scott@Adatum.com" -SamAccountName "Scott" -PasswordNeverExpires $true -Department "Research" -Company "Adatum" -Path "OU=Research,DC=Adatum,DC=com" -AccountPassword $password -Enabled $true
Add-ADGroupMember -Identity Research -Members Scott
New-ADUser -GivenName "Alice" -Surname "Ciccu" -Name "Alice Ciccu" -DisplayName "Alice Ciccu" -City "Seattle" -Country "US" -UserPrincipalName "Alice@Adatum.com" -SamAccountName "Alice" -PasswordNeverExpires $true -Department "Marketing" -Company "Adatum" -Path "OU=Marketing,DC=Adatum,DC=com" -AccountPassword $password -Enabled $true
Add-ADGroupMember -Identity Marketing -Members Alice
New-ADUser -GivenName "Terry" -Surname "Earls" -Name "Terry Earls" -DisplayName "Terry Earls" -City "London" -Country "GB" -UserPrincipalName "Terry@Adatum.com" -SamAccountName "Terry" -PasswordNeverExpires $true -Department "IT" -Company "Adatum" -Path "OU=IT,DC=Adatum,DC=com" -AccountPassword $password -Enabled $true
Add-ADGroupMember -Identity IT -Members Terry
New-ADUser -GivenName "Reda" -Surname "Sayegh" -Name "Reda Sayegh" -DisplayName "Reda Sayegh" -City "London" -Country "GB" -UserPrincipalName "Reda@Adatum.com" -SamAccountName "Reda" -PasswordNeverExpires $true -Department "Sales" -Company "Adatum" -Path "OU=Sales,DC=Adatum,DC=com" -AccountPassword $password -Enabled $true
Add-ADGroupMember -Identity Sales -Members Reda
New-ADUser -GivenName "Jane" -Surname "Dow" -Name "Jane Dow" -DisplayName "Jane Dow" -City "London" -Country "GB" -UserPrincipalName "Jane@Adatum.com" -SamAccountName "Jane" -PasswordNeverExpires $true -Department "IT" -Company "Adatum" -Path "OU=IT,DC=Adatum,DC=com" -AccountPassword $password -Enabled $true
Add-ADGroupMember -Identity IT -Members Jane
New-ADUser -GivenName "Jon" -Surname "Cantrell" -Name "Jon Cantrell" -DisplayName "Jon Cantrell" -City "London" -Country "GB" -UserPrincipalName "Jon@Adatum.com" -SamAccountName "Jon" -PasswordNeverExpires $true -Department "IT" -Company "Adatum" -Path "OU=IT,DC=Adatum,DC=com" -AccountPassword $password -Enabled $true
Add-ADGroupMember -Identity IT -Members Jon

Remove-Item -Path "C:\Labfiles" -Recurse -Force
$zipFileUrl = "https://github.com/AqStudio1/LON-DC1/archive/refs/heads/main.zip"
$zipFilePath = "repository.zip"
Invoke-WebRequest -Uri $zipFileUrl -OutFile $zipFilePath
Expand-Archive -Path $zipFilePath -DestinationPath ".\"
Copy-Item -Path ".\LON-DC1-main\Labfiles" -Destination "C:\Labfiles" -Recurse
Remove-Item -Path ".\repository.zip" -Recurse -Force
Remove-Item -Path ".\LON-DC1-main" -Recurse -Force

New-Item -ItemType Directory -Path "C:\Labfiles\Apps\PowerBI"
Invoke-WebRequest -Uri "https://download.microsoft.com/download/8/8/0/880BCA75-79DD-466A-927D-1ABF1F5454B0/PBIDesktopSetup_x64.exe" -OutFile "C:\Labfiles\Apps\PowerBI\PBIDesktopSetup_x64.exe"

New-Item -ItemType Directory -Path "C:\Labfiles\Apps\PowerToys"
Invoke-WebRequest -Uri "https://github.com/microsoft/PowerToys/releases/download/v0.87.1/PowerToysSetup-0.87.1-x64.exe" -OutFile "C:\Labfiles\Apps\PowerToys\PowerToysSetup-x64.exe"

New-Item -ItemType Directory -Path "C:\Labfiles\Provisioning"

icacls "C:\Labfiles" /grant "Adatum\Domain Users:(OI)(CI)F" /T
New-SmbShare -Name "Labfiles" -Path "C:\Labfiles" -FullAccess "Everyone"

$serverName = "LON-DC1"
$scopeName = "Adatum"
$startIP = "172.16.0.160"
$endIP = "172.16.0.190"
$subnetID = "172.16.0.0"
$subnetMask = "255.255.0.0"
$gateway = "172.16.0.1"
$dnsServer = "172.16.0.10"
Install-WindowsFeature -Name "DHCP" -IncludeManagementTools
Import-Module DhcpServer
Add-DhcpServerInDC -DnsName $env:COMPUTERNAME -IPAddress (Get-WmiObject -Class Win32_NetworkAdapterConfiguration | Where-Object { $_.IPEnabled -eq $true }).IPAddress[0]
Add-DhcpServerv4Scope -Name $scopeName -StartRange $startIP -EndRange $endIP -SubnetMask $subnetMask
Set-DhcpServerv4OptionValue -ScopeId $subnetID -Router $gateway
Set-DhcpServerv4OptionValue -ScopeId $subnetID -DnsServer $dnsServer
Set-DhcpServerv4Scope -ScopeId $subnetID -State Active

Install-WindowsFeature BitLocker -IncludeAllSubFeature -IncludeManagementTools

$ADKDownloadURL = "https://go.microsoft.com/fwlink/?linkid=2289980"
$WinPEDownloadURL = "https://go.microsoft.com/fwlink/?linkid=2289981"
New-Item -ItemType Directory -Path "C:\Program Files (x86)\Windows Kits\10"
$ADKInstallPath = "C:\Program Files (x86)\Windows Kits\10"
$WinPEInstallPath = "C:\Program Files (x86)\Windows Kits\10"
Invoke-WebRequest -Uri $ADKDownloadURL -OutFile "$ADKInstallPath\ADKsetup.exe"
Start-Process -FilePath "$ADKInstallPath\ADKsetup.exe" -ArgumentList "/Quiet /InstallPath `"$ADKInstallPath`" /features OptionId.DeploymentTools OptionId.UserStateMigrationTool" -Wait
Invoke-WebRequest -Uri $WinPEDownloadURL -OutFile "$WinPEInstallPath\WinPEsetup.exe"
Start-Process -FilePath "$WinPEInstallPath\WinPEsetup.exe" -ArgumentList "/Quiet /InstallPath `"$WinPEInstallPath`"" -Wait

Restart-Computer -Force
