# Ansible Windows 11 Home Game Development Workstation
This repo exists to assist me in automating the installation, configuration, and security hardening of a Windows 11 Home gaming and game development PC.

## Update BIOS
Generally speaking you should always update your motherboard BIOS when doing a new OS install. Typically this is as simple as download latest from manf website, copy to USB, reboot into BIOS, and update.

## Install Windows 11 Home

#### Create ISO
Using a Windows OS and the Windows Media Creation Tool, create a USB bootable Windows installer.

https://www.microsoft.com/en-us/software-download/windows11
https://support.microsoft.com/en-us/windows/create-installation-media-for-windows-99a58364-8c02-206f-aa6f-40c3b507420d

Also copy over any drivers needed (LAN, RAID, etc)

#### Install
- Install Windows 11 Home
- Activate Windows 11 Home with Key
- Sign into Microsoft Account
- Create new admin user to run ansible
```
New-LocalUser -Name "NewAdmin" -Password (Read-Host -AsSecureString)
Add-LocalGroupMember -Group "Administrators" -Member "NewAdmin"
```

Log into that newly created user

Switch from Public network to Private

Enable winrm
```
Enable-PSRemoting -Force
Set-Item WSMan:\localhost\Service\Auth\Basic $true
Set-Item WSMan:\localhost\Service\AllowUnencrypted $true
```

Log out of the user and run this playbook

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

- Uninstall NVIDIA App
- Adjust Display
    - Enable HDR
    - Set Display Refresh Rate to 360
- Task Bar customize
    - Remove edge
    - Remove store
    - add firefox private
- Configure Steam
    - Log into Steam
    - Install Steam games
- Log into Unity Hub
- Configure Ubuntu WSL2
    - Install Git
    - Add GitHub API key to for git to Ubuntu WSL
    - Symlink WSL to desktop
    - Clone repos