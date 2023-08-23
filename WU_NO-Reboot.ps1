Install-PackageProvider -Name NuGet -force
Install-Module -Name PSWindowsUpdate -force
Install-WindowsUpdate -MicrosoftUpdate -IgnoreReboot -SendReport -PSWUSettings @{SmtpServer="o365relay.corp.amergroup.it";From="update_alert@amergroup.it";To="windows_update@amergroup.it";Port=25} -Verbose -Confirm:$False

$(Get-WURebootStatus -Silent -outvariable Status)

if ($Status -like "True") {
    Get-WURebootStatus -SendReport -PSWUSettings @{SmtpServer="o365relay.corp.amergroup.it";From="update_alert@amergroup.it";To="windows_update@amergroup.it";Port=25;} -Silent
    } else
    {
    echo "No reboot needed"
    }
exit