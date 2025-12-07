# w11-gamedev-workstation-ansible

## Prerequisites

### Localhost Config

```sh
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES
# or
echo 'export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES' >> ~/.zshrc
```

### Update hosts
Get the windows private ip and update hosts file with it

### Remote Host Config

Enable winrm
```
winrm quickconfig
Enable-PSRemoting -Force
Set-Item - Path "WSMan:\localhost\Service\Auth\Basic" -Value $true
Set-Item - Path "WSMan:\localhost\Service\AllowUnencrypted" -Value $true
```

## Running Playbook
```
ansible-playbook w11.yml
```
