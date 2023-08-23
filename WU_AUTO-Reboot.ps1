Install-PackageProvider -Name NuGet -force 
Install-Module -Name PSWindowsUpdate -force
Install-WindowsUpdate -MicrosoftUpdate -AutoReboot -SendReport -PSWUSettings @{SmtpServer="o365relay.corp.amergroup.it";From="update_alert@amergroup.it";To="windows_update@amergroup.it";Port=25} -Verbose -Confirm:$False
#Get-WUlist -MicrosoftUpdate
#Get-WUHistory