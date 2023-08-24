Install-PackageProvider -Name NuGet -force 
Install-Module -Name PSWindowsUpdate -force
Install-WindowsUpdate -MicrosoftUpdate -AutoReboot -SendReport -PSWUSettings @{SmtpServer="relay";From="alert@domain";To="update@domain";Port=25} -Verbose -Confirm:$False
