Install-PackageProvider -Name NuGet -force
Install-Module -Name PSWindowsUpdate -force
Install-WindowsUpdate -MicrosoftUpdate -IgnoreReboot -SendReport -PSWUSettings @{SmtpServer="relay";From="update_alert@domain";To="windows_update@domain";Port=25} -Verbose -Confirm:$False

$(Get-WURebootStatus -Silent -outvariable Status)

if ($Status -like "True") {
    Get-WURebootStatus -SendReport -PSWUSettings @{SmtpServer="relay";From="update_alert@domain";To="windows_update@domain";Port=25;} -Silent
    } else
    {
    echo "No reboot needed"
    }
exit
