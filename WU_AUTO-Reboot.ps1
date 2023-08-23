Install-PackageProvider -Name NuGet -force 
Install-Module -Name PSWindowsUpdate -force
Install-WindowsUpdate -MicrosoftUpdate -AutoReboot -SendReport -PSWUSettings @{SmtpServer="relay";From="update_alert@domain";To="windows_update@domain";Port=25} -Verbose -Confirm:$False
#Get-WUlist -MicrosoftUpdate
#Get-WUHistory
