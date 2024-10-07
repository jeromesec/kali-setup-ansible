# Kali setup via Ansible
This is an ansible playbook to automate the setup of a kali machine used for penetration testing. 

## Setup philosophy
* Installing of tools via apt will take precedence over building from source when running the latest version is not necessary.
* Anything installed outside of apt and not a paid tool will be installed in the user's home directory (this can be modified if required).
* Paid for commercial tools will be installed in /opt

## Tested on
Kali 2024.3 (Installer edition)

## Roles
| Tool | Description |
|-|-|
| common | Installation of common configuration tools and dependencies |
| network | Installation of commonly used internal and external network penetration testing tools |
| web | Installation of commonly used web application penetration testing tools |
| wireless | Installation of commonly used wireless tools penetration testing tools and drivers. Drivers are realtek-rtl88xxau and should work with ALFA AWUS036ACH and AWUS1900 wireless adapters. |
| wordlists | Download payloads and wordlists |
| **Paid Tools** | |
| Nessus | Installation of Nessus.|
| Burp Suite Professional | Installation of Burp Suite Professional.|

## Paid for commercial tools
Set the `paid_software` variable to `true` when running the playbook to include the installation of paid for commercial software. For example: `ansible-playbook --extra-vars "paid_software=true" -K -i inventory.ini site.yml`

### Nessus
The Nessus web server has been configured to only listen to the localhost so it can be accessed by https://127.0.0.1:8834. You will need to go through the process of registering Nessus and creating a user. In the future this will be automated in an update.

### Burp Suite Professional
You will need to go through the process of registering Burp Suite Professional to use the software. In the future this will be automated in an update (if possible).

## How to use this playbook from an Ansible Controller
**Step 1**: Git clone repo:
```
git clone https://github.com/jeromesec/kali-setup-ansible.git
```

**Step 2**: Modify the Kali IP address in `inventory.ini` file. For example:
```
[kalihosts]
10.10.10.10

[kalihosts:vars]
...
```

**Note:** If you want to include several Kali machines just add one IP address per line. For example:
```
[kalihosts]
10.10.10.10
10.10.10.11
    
[kalihosts:vars]
...
```

**Step 3**: Modify the `user` in the `./group_vars/all_vars` file. An assumption has been made that the same user will be used for Ansible and using the Kali machine.

**Note**: You can also change the tools and wordlists path in the same file if you do not want them to be installed in the home directory.

**Step 4**: Run the playbook:

**Note**: You will be prompted for the sudo password.
```
ansible-playbook -K -i inventory.ini site.yml
``` 

**Note**:To include the installation of paid for commercial software run the following command instead of the above command:
```
ansible-playbook --extra-vars "paid_software=true" -K -i inventory.ini site.yml
````

## How to use this playbook locally

**Step 1**: Install ansible on the localhost:
```
sudo apt install ansible:
```
**Step 2**: Git clone repo
```
git clone https://github.com/jeromesec/kali-setup-ansible.git
```
**Step 3**: Run the playbook:
```
ansible-playbook -i localhost.ini local.yml
```
**Note**: To include the installation of paid for commercial software run the following command instead of the above command:
```
ansible-playbook --extra-vars "paid_software=true" -i localhost.ini local.yml
```


## Author
JeromeSec

## Acknowledgements
https://github.com/dennis6400/kali-setup

https://github.com/hackedbyagirl/offensive-kali-ansible

https://github.com/iesplin/ansible-playbook-kali