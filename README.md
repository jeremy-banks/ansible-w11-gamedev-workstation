# Ansible Winslop 11 Home Game Development Workstation
This repo exists to assist me in automating the installation, configuration, and security hardening of a Winslop 11 Home install for gaming and game development PC using the IaC tool Ansible.

## Update BIOS
BIOS should ***always*** be updated when doing a new OS install. Download latest from website, copy to USB, reboot into BIOS, flash.

## Install Winslop 11 Home

### Create USB Installer
- Download Rufus https://rufus.ie/en/
- Download latest Winslop 11 ISO https://www.microsoft.com/en-us/software-download/windows11
- Create USB Installer with default settings

### Install and Configure
- Install Winslop 11 Home
- Activate Winslop 11 Home with key
- Click "I don't have internet" (internet access is configured at a later step)
- Create user and password
- Create security questions
- Accept privacy

### Configure LAN
- Install LAN Drivers https://rog.asus.com/us/motherboards/rog-strix/rog-strix-x670e-f-gaming-wifi-model/helpdesk_download/

```
Set-NetConnectionProfile -NetworkCategory Private
Enable-PSRemoting -Force
Set-Item WSMan:\localhost\Service\Auth\Basic $true
Set-Item WSMan:\localhost\Service\AllowUnencrypted $true
```

## Run Ansible Playbook

### Localhost Config
I had to do this on Mac to get the connection to Winslop working

```echo 'export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES' >> ~/.zshrc```

Otherwise the system threw error ```[ERROR]: A worker was found in a dead state```

### Update hosts
Get the Winslop workstation's private ip and update hosts file with it

### Execute Playbook
Now you're ready to execute your playbook! Sit back, crack open a Mt Dew, and get ready to game.

```ansible-playbook w11.yml -vv```

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
    - Log into Unreal Launcher
    - Configure Ubuntu WSL2
        - Create initial user
        - Symlink repos `ln -s /mnt/c/Users/NewAdmin/Documents/repos ~/repos`
        - Symlink .ssh
            - `rm -rf ~/.ssh`
            - `ln -s /mnt/c/Users/NewAdmin/Documents/.ssh ~/.ssh`
        - Install Git `sudo apt update && sudo apt install git`
        - Configure Git
            - `git config --global user.name "Jeremy Banks"`
            - `git config --global user.email "jeremybankstech@gmail.com"`
            - `git config --global init.defaultBranch main`
        - Add GitHub API key to for git to Ubuntu WSL
        - Clone repos

- Winslop customizations
    - Task Bar customize
        - Remove edge
        - Remove store
        - add firefox private
