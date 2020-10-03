# Introduction to Chef InSpec  
This exercise uses Chef InSpec to compare our EC2 instance's actual state with our desired state: 
1. Check for any non-expected listening ports. 
	* The expected listening ports are`22 (SSH)`, `53 (bind on 127.0.0.1)`, and 80 `(HTTP)` only. 
1. Verify that SSH and Apache2 are running and configured to start automatically at boot. 
1. Look for configurations which will disable the Apache2 web server version disclosure.
![image](https://user-images.githubusercontent.com/71627887/94924824-d1981800-04f0-11eb-9eaa-59cf8bbad7e6.png)
![image](https://user-images.githubusercontent.com/71627887/94924972-0f953c00-04f1-11eb-8c10-5b5cec23a11d.png)

SSH key-based authentication is adopted for this exercise.

## Pre-requisites
1. [Install Chef InSpec](https://www.inspec.io/downloads/) on your local machine.
1. Access to our Ubuntu EC2 instances, which has been installed with Apache2. 

### Components (with version) used in this exercise
* EC2 AMI: `ami-0c8e97a27be37adfd`
* Apache2 version: `2.4.29`
* Chef InSpec version: `4.23.4`

### To run the InSpec script
1. Add our local SSH private key into our local SSH agent, `ssh-add "<private key path>"`
1. Run `inspec exec controls -t ssh://<login username>@<ec2 IP address>`
