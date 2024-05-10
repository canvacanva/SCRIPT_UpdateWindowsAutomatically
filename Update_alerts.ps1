Install-PackageProvider -Name NuGet -force
Install-Module -Name PSWindowsUpdate -force
Get-WUList -Category 'Security Updates','Critical Updates' -SendReport -PSWUSettings @{SmtpServer="relay";From="security_update@sss";To="it@sss";Port=25;} -Silent