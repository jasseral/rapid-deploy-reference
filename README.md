# rapid-deploy-reference
---
###### This proyect deploy a nginx server using terraform & ansible this is for rapid reference 

## Terraform file description

- aws_key_pair.tf
Instance aws_key_pair this file use a public key located in ~/.ssh/aws.pub you can create with the command ```$ ssh-keygen ```
- aws_security_group.tf
This file instance two security_group for provide port access 80 and 22
- variables.tf
Values used for main.tf 
- main.tf
This file orchest the operation, create a EC2 t2.micro instance and write the file hosts with the public ip address
the file host will be used for ansible as inventory

## Ansible file description

- initial.yml
Create a user operator as sudoers with NOPASSWD: ALL for future operations
- dependencies.yml
Install Docker , python3-pip , docker-py , APT Transport HTTPS
- container.yml
Create a nginx container with port 80 avaliable


## Pre requisites
- Configure your aws credencials , you can use aws ```$ aws configure``` the profile used for main.tf is default
- ansible  2.5.1 or above
- terraform  v0.12.26 or above 


# Run 
- Go to the folder Terraform and run the command terraform init for download aws provider
- Execute flavor script sh flavor.sh 
- Open the ip address in your browser
