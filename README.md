# Kali setup via Ansible
This is an ansible playbook to automate the setup of a kali machine used for penetration testing. 

## Setup philosophy
* Installing of tools via apt will take precedence over building from source when running the latest version is not necessary.
* Anything installed outside of apt will be installed in the user's home directory (this can be modified if required).

## Tested on
Kali 2024.3 (Installer edition)

## Role
| Tool | Description |
|-|-|
| common | Installation of common configuration tools and dependencies |
| network | Installation of commonly used internal and external network penetration testing tools |
| web | Installation of commonly used web application penetration testing tools |
| wireless | Installation of commonly used wireless tools penetration testing tools and drivers. Drivers are realtek-rtl88xxau and should work with ALFA AWUS036ACH and AWUS1900 wireless adapters. |
| wordlists | Download payloads and wordlists |

## How to use
1. Modify the Kali IP address in `inventory.ini` file. For example:
    ```
    [kalihosts]
    10.10.10.10
    
    [kalihosts:vars]
    ...
    ```

    If you want to include several Kali machines just add one IP address per line. For example:
    ```
    [kalihosts]
    10.10.10.10
    10.10.10.11
    
    [kalihosts:vars]
    ...
    ```

2. Modify the `user` in the `./group_vars/all_vars` file. An assumption has been made that the same user will be used for Ansible and using the Kali machine.

    You can also change the tools and wordlists path in the same file if you do not want them to be installed in the home directory.
3. Git clone the repo `git clone https://github.com/jeromesec/ansible-pentestvm.git`
4. Run the playbook `ansible-playbook -K -i inventory.ini playbook.yml`. You will be prompted for the sudo password. 


## Author
JeromeSec

## Acknowledgements
https://github.com/dennis6400/kali-setup

https://github.com/hackedbyagirl/offensive-kali-ansible

https://github.com/iesplin/ansible-playbook-kali