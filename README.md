# Ansible Winslop 11 Home Game Development Workstation
This repo exists to assist me in automating the installation, configuration, and security hardening of a Winslop 11 Home gaming and game development PC using the IaC tool known as Ansible.

## Update BIOS
Generally speaking you should always update your motherboard BIOS when doing a new OS install. Typically this is as simple as download latest from manf website, copy to USB, reboot into BIOS, and update.

## Install Winslop 11 Home

#### Create ISO
Using a Winslop OS and the Winslop Media Creation Tool, create a USB bootable Winslop installer.

https://www.microsoft.com/en-us/software-download/windows11
https://support.microsoft.com/en-us/windows/create-installation-media-for-windows-99a58364-8c02-206f-aa6f-40c3b507420d

Also copy over any drivers needed (LAN, RAID, etc).

#### Install
- Install Winslop 11 Home
- Activate Winslop 11 Home with Key
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
I had to do this on Mac to get the connection to Winslop working

```echo 'export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES' >> ~/.zshrc```

Otherwise the system threw error ```[ERROR]: A worker was found in a dead state```

#### Update hosts
Get the Winslop private ip and update hosts file with it

#### Remote Host Config
Now you're ready to execute your playbook! Sit back, crack open a Mt Dew, and get ready to game.

```ansible-playbook w11.yml```

## Manual Settings
Ansible and PowerShell are indeed powerful tools for automation, but there are some limitations. Perhaps with more time these can be identified:

- Display
    - Uninstall NVIDIA App
    - Adjust Display
        - Enable HDR
        - Set Display Refresh Rate to 360
- Apps
    - Configure Steam
        - Log into Steam
        - Install Steam games
    - Log into Unity Hub
    - Configure Ubuntu WSL2
        - Create initial user
        - Symlink Documents
            - ```ln -s /mnt/c/Users/NewAdmin/Documents/repos ~/repos```
        - Install Git
        - Add GitHub API key to for git to Ubuntu WSL
        - Clone repos
- Winslop customizations
    - Task Bar customize
        - Remove edge
        - Remove store
        - add firefox private
