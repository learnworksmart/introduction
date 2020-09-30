# Terraform + AWS tutorial 
This exercise is to provision a publicly accessible EC2 instance using Terraform. 

## Pre-requisites
On your local machine, you will need to: 
1. [install AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html) 
1. [install Terraform](https://www.terraform.io/downloads.html)
1. [configure AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-files.html)
    * You will need [programmatic access](https://docs.aws.amazon.com/general/latest/gr/aws-sec-cred-types.html#access-keys-and-secret-access-keys) which comes with `AmazonEC2FullAccess` permission.  

You will need to provide the following details on **variables.tf**: 
1. The AWS region which you are working on. 
1. The targeted public key file which is hosted on your local machine. 
    * Refer [here](https://docs.rightscale.com/faq/How_Do_I_Generate_My_Own_SSH_Key_Pair.html) on how to generate key pair. 
1. The AWS credential file, which is created once you have configured the AWS logins on your local machine.
1. The AWS profile, which can be queried with `cat ~/.aws/config`. 

## What the Terraform definition files do: 
1. Upload the selected public key into [AWS key pairs](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-key-pairs.html#how-to-generate-your-own-key-and-import-it-to-aws). 
1. Create a security group that allows inbound SSH, port 22, access. 
1. Create an EC2 instance, (1) with the above uploaded public key, and (2) attached with the above security group. 

### To apply the Terraform definition files
1. `terraform init`
1. `terraform plan`
1. `terraform apply -auto-approve`
![image](https://user-images.githubusercontent.com/71627887/94344659-5dbec100-0053-11eb-8336-4db39cd37207.png)

### To undo the Terraform definition files
1. `terraform plan -destroy`
1. `terraform destroy -auto-approve` 
![image](https://user-images.githubusercontent.com/71627887/94344592-133d4480-0053-11eb-9111-1e076ac3f88a.png)
