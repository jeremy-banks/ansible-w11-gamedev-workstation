# ansible-w11-gamedev-workstation
Steps to create and maintain a Windows 11 Home gaming and game development machine.

## Update BIOS

## Install Windows 11

#### Create ISO
Using a Windows OS and the Windows Media Creation Tool, create a USB bootable Windows installer.

https://www.microsoft.com/en-us/software-download/windows11
https://support.microsoft.com/en-us/windows/create-installation-media-for-windows-99a58364-8c02-206f-aa6f-40c3b507420d

Also copy over any drivers needed (LAN, RAID, etc)

#### Install
- Install Windows 11
- Activate Windows 11 with Key
- Sign into Microsoft Account
- Create new admin user to run ansible
```
New-LocalUser -Name "NewAdmin" -Password (Read-Host -AsSecureString)
Add-LocalGroupMember -Group "Administrators" -Member "NewAdmin"
```

Switch from Public network to Private

Enable winrm
```
winrm quickconfig
Enable-PSRemoting -Force
winrm set winrm/config/service/auth '@{Basic="true"}'
winrm set winrm/config/service '@{AllowUnencrypted="true"}'
winrm quickconfig -transport:http
```

## Run Ansible Playbook

#### Localhost Config

```sh
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES
# or
echo 'export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES' >> ~/.zshrc
```

#### Update hosts
Get the windows private ip and update hosts file with it

#### Remote Host Config
```
ansible-playbook w11.yml
```

## Manual Settings
Perhaps with more time these can be identified:

- Enable HDR
- Set Display Refresh Rate to 360
