Get-NetFirewallRule -DisplayName "File and Printer Sharing (Echo Request - ICMPv4-In)" | Set-NetFirewallRule -Profile Domain,Private,Public -Enabled True
Set-NetFirewallRule -DisplayGroup "Network Discovery" -Profile Domain,Private,Public -Enabled True
Set-NetFirewallRule -DisplayGroup "File and Printer Sharing" -Profile Domain,Private,Public -Enabled True

Restart-Computer -Force
