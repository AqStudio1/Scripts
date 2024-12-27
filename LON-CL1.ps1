Resize-Partition -DriveLetter C -Size 75GB
New-Partition -DiskNumber 0 -Size 25GB -AssignDriveLetter
Format-Volume -DriveLetter E -FileSystem NTFS -NewFileSystemLabel "Allfiles"

$zipFileUrl = "https://github.com/AqStudio1/LON-CL1/archive/refs/heads/main.zip"
$zipFilePath = "repository.zip"
Invoke-WebRequest -Uri $zipFileUrl -OutFile $zipFilePath
Expand-Archive -Path $zipFilePath -DestinationPath ".\"
Copy-Item -Path ".\LON-CL1-main\Files" -Destination "C:\Files" -Recurse
Copy-Item -Path ".\LON-CL1-main\Labfiles" -Destination "E:\Labfiles" -Recurse
Remove-Item -Path ".\LON-CL1-main" -Recurse -Force

New-Item -ItemType Directory -Path "E:\Labfiles\Tools"
Invoke-WebRequest -Uri "https://aka.ms/WACDownload" -OutFile "E:\Labfiles\Tools\WindowsAdminCenter.exe"

Get-NetFirewallRule -DisplayName "File and Printer Sharing (Echo Request - ICMPv4-In)" | Set-NetFirewallRule -Profile Domain,Private,Public -Enabled True
Set-NetFirewallRule -DisplayGroup "Network Discovery" -Profile Domain,Private,Public -Enabled True
Set-NetFirewallRule -DisplayGroup "File and Printer Sharing" -Profile Domain,Private,Public -Enabled True
