# DFIR Investigation VM
This repository provides a Vagrantfile as well as initialisation scripts in order to easily and quickly spin up a DFIR investigation VM.

## Currently Supported Versions
Currently, only the following versions are supported:

|||
|--------------|------------------|
|Virtualisation|VMware Workstation|
|Host OS|Windows, Ubuntu|
|DFIR VM|Windows 11, Ubuntu|


## Prerequisites
Before you can spin up the DFIR Investigation VM, please make sure that the following prerequisites are met:

* VMware Workstation is installed on the host
* You have run the approperiate initialisation script (`scripts/Install_Prerequisites.[ps1|sh]`)

## Spin Up VMs
In order to spin up the VM, copy the corresponding `Vagrantfile_*` to `Vagrantfile` and then run `vagrant up`.

```bash
cp Vagrantfile_Ubuntu_VM Vagrantfile
vagrant up
```