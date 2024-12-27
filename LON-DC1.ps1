Import-Module ActiveDirectory

Remove-ADUser -Identity "Jon" -Confirm:$false
Remove-ADUser -Identity "Terry" -Confirm:$false

Remove-ADObject -Identity "CN=LON-CL2,CN=Computers,DC=Adatum,DC=COM" -Confirm:$false -Recursive

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
