Set-ExecutionPolicy Bypass -Scope Process -Force
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

choco install vagrant --yes
vagrant plugin install vagrant-reload
vagrant plugin install vagrant-vmware-desktop
vagrant plugin install winrm
vagrant plugin install winrm-elevated

IWR -Url "https://releases.hashicorp.com/vagrant-vmware-utility/1.0.24/vagrant-vmware-utility_1.0.24_windows_amd64.msi" -OutFile "C:\Windows\Temp\vagrant-vmware-utility.msi"
msiexec /i "C:\Windows\Temp\vagrant-vmware-utility.msi" /qn 