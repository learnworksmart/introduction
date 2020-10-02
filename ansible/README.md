# Introduction to Ansible Playbook  
This exercise is to apply 2 sets of configurations across a group of EC2 instances running on Ubuntu. The first configuration `common` will be applied to all EC2 while the other configuration `webserver` only applicable to specify EC2. SSH key-based authentication is adopted for this exercise.

### What the Ansible-playbook definition files do:
1. All required inputs are managed under `inventory.yml` file. 
1. The `common` configurations:
	* create a new user account
	* apply SSH configurations 
1. The `webserver` configuration:
	* install apache2 

## Pre-requisites
1. On your local machine [install Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)
1. Have 2 publicly accessible Ubuntu EC2 instances running, and allow port 22 (SSH) and port (80) HTTP access. 
1. A common login credential that can SSH into both EC2 instances with root access. 
1. Generate another set of new [key-pair](https://docs.rightscale.com/faq/How_Do_I_Generate_My_Own_SSH_Key_Pair.html) which will be used for creating a new account.   

You will need to provide the following details in **inventory.yml**:
1. Supply the `ansible_user` with the common login username for accessing the EC2 instances. 
1. The EC2 instances IP address under `all` and `webserver` hosts. 
1. The new account's login username, password and and SSH public key, which will be created on all EC2 instances. 

### Components (with version) used in this exercise
* Ansible: `2.10.1`
* Python: `3.8.2`

### To apply the configurations
1. Run `ansible-playbook -i inventory setup.yml`

![image](https://user-images.githubusercontent.com/71627887/94677800-16d11400-0350-11eb-9ad3-be8ac64fdfc2.png)

## Encountered Error
```
[WARNING]: Platform linux on host XX.XX.XX.XX is using the discovered Python interpreter at
/usr/bin/python, but future installation of another Python interpreter could change the meaning of
that path. See https://docs.ansible.com/ansible/2.10/reference_appendices/interpreter_discovery.html
for more information.
```
The above error was encountered when the supplied EC2 instances do not have python3 installed. To resolve this we can either: 
1. Make sure the provided EC2 instances are installed with python3, or
1. Under `inventory.yml` change the value for `ansible_python_interpreter: /usr/bin/python3` to `ansible_python_interpreter: /usr/bin/python`


```
fatal: [XX.XX.XX.XX]: FAILED! => {"msg": "crypt.crypt not supported on Mac OS X/Darwin, install passlib python module"}
```
Install passlib python module, `pip install passlib` or `pip3 install passlib`, to resolve this error. 



