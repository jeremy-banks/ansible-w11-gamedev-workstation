# w11-gamedev-workstation-ansible

## Prerequisites

### Install Windows 11
- Install Windows 11
- Load RAID and LAN drivers
- Activate Windows 11 with Key
- Sign into Microsoft Account
- Create new admin user to run ansible
```
$password = Read-Host -AsSecureString `
    "yourPassword"; `
New-LocalUser -Name "medes" `
    -Password $password; `
Add-LocalGroupMember -Group "Administrators" `
    -Member "medes"
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

## Running Playbook

### Localhost Config

```sh
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES
# or
echo 'export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES' >> ~/.zshrc
```

### Update hosts
Get the windows private ip and update hosts file with it

### Remote Host Config
```
ansible-playbook w11.yml
```
