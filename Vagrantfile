Vagrant.configure("2") do |config|
  # Use a Windows 11 box that supports VMware
  config.vm.box = "gusztavvargadr/windows-11" 
  config.vm.box_version = ">= 0"

  # Provider: VMware Workstation Pro
  config.vm.provider "vmware_desktop" do |v|
    v.gui = true
    v.memory = 8192
    v.cpus = 4

    v.vmx["displayName"] = "DFIR Investigation VM - Win11"
    v.force_vmware_license = "workstation"
  end

  # Set up communicator (Windows needs WinRM, not SSH)
  config.vm.communicator = "winrm"

  # Check the host system
  host_os = RbConfig::CONFIG['host_os']

  if host_os =~ /linux/
    puts "==> Detected Linux host: using Ansible provisioner"
    config.vm.provision "ansible_local" do |ansible|
      ansible.playbook = "C:/vagrant/ansible/playbook.yml"
      ansible.compatibility_mode = "2.0"
    end
  elsif host_os =~ /mswin|mingw|cygwin/
    puts "==> Detected Windows host: using PowerShell provisioner"
    config.vm.provision "shell", path: "scripts/CreateEnvironment.ps1"
    config.vm.provision "reload"
    config.vm.provision "shell", path: "scripts/InstallChocolatey.ps1"
    config.vm.provision "shell", path: "scripts/InstallTools.ps1"
  end
end