Resize-Partition -DriveLetter C -Size 100GB
New-Partition -DiskNumber 0 -Size 10GB -AssignDriveLetter
Format-Volume -DriveLetter E -FileSystem NTFS -NewFileSystemLabel "Allfiles"

$zipFileUrl = "https://github.com/AqStudio1/LON-CL1/archive/refs/heads/main.zip"
$zipFilePath = "repository.zip"
Invoke-WebRequest -Uri $zipFileUrl -OutFile $zipFilePath
Expand-Archive -Path $zipFilePath -DestinationPath ".\"
Copy-Item -Path ".\LON-CL1-main\Files" -Destination "C:\Files" -Recurse
Copy-Item -Path ".\LON-CL1-main\Labfiles" -Destination "E:\Labfiles" -Recurse
Remove-Item -Path ".\repository.zip" -Recurse -Force
Remove-Item -Path ".\LON-CL1-main" -Recurse -Force

New-Item -ItemType Directory -Path "E:\Labfiles\Tools"
Invoke-WebRequest -Uri "https://download.microsoft.com/download/1/0/5/1059800B-F375-451C-B37E-758FFC7C8C8B/WindowsAdminCenter2110.msi" -OutFile "E:\Labfiles\Tools\WindowsAdminCenter2110.msi"

New-Item -ItemType Directory -Path "C:\Labfiles\Apps\PowerBI"
Invoke-WebRequest -Uri "https://download.microsoft.com/download/8/8/0/880BCA75-79DD-466A-927D-1ABF1F5454B0/PBIDesktopSetup_x64.exe" -OutFile "C:\Labfiles\Apps\PowerBI\PBIDesktopSetup_x64.exe"

New-Item -ItemType Directory -Path "C:\Labfiles\Apps\PowerToys"
Invoke-WebRequest -Uri "https://github.com/microsoft/PowerToys/releases/download/v0.87.1/PowerToysSetup-0.87.1-x64.exe" -OutFile "C:\Labfiles\Apps\PowerToys\PowerToysSetup-x64.exe"

New-Item -ItemType Directory -Path "C:\Labfiles\Provisioning"

Get-NetFirewallRule -DisplayName "File and Printer Sharing (Echo Request - ICMPv4-In)" | Set-NetFirewallRule -Profile Domain,Private,Public -Enabled True
Set-NetFirewallRule -DisplayGroup "Network Discovery" -Profile Domain,Private,Public -Enabled True
Set-NetFirewallRule -DisplayGroup "File and Printer Sharing" -Profile Domain,Private,Public -Enabled True

Restart-Computer -Force
