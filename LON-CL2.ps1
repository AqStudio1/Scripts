Get-NetFirewallRule -DisplayName "File and Printer Sharing (Echo Request - ICMPv4-In)" | Set-NetFirewallRule -Enabled True
Set-NetFirewallRule -DisplayGroup "Network Discovery" -Enabled True
Set-NetFirewallRule -DisplayGroup "File and Printer Sharing" -Enabled True

$securePassword = ConvertTo-SecureString "Pa55w.rd" -AsPlainText -Force
$credential = New-Object System.Management.Automation.PSCredential("Adatum\Administrator", $securePassword)
Remove-Computer -UnjoinDomainCredential $credential -PassThru -Verbose -Restart -Force
