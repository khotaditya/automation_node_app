# Automation hero tech assignment

Following information provides an automated solution to create EC2 instance on AWS and run nginx webserver on EC2.

## Requirements

* AWS account
* terraform v1.1.4
* ansible v2.12.1
* python v3.10.1

## Step 1
AWS initial steps
- Create IAM user on AWS account with the access of VPC, subnet, ec2, security groups.
- Get access key and secret key
- Create key pair to access ssh

## Step 2
Installation
- Install terraform on your local machine or one the ec2 instance using https://www.terraform.io/downloads
- Install ansible https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html
- Confirm all installation by checking their version

## Step 3
Terraform script to create infrastructure on AWS
- Create a file, provider.tf. This file stores the credentials to access AWS (check terraform/provider.tf file for reference)
- Create terraform resources file which creates AWS resources. (check terraform/resource.tf for refernece)
- resource.tf creates vpc, subnet, security group and ec2.
- run following command to init terraform
```bash
terraform init
```
- Above command will download aws plugin and initialize the terraform
- To check an execution plan
```bash
terraform plan
```
- It will show step by step the excution plan which will create resources
- To execute the plan
```bash
terraform apply -auto-approve
```
- This will create resources on AWS

## Step 4
Creating Dockerfile and index.html (ref. docker/Dockerfile and docker/index.html)

## Step 5
Ansible script to deploy and run the nginx application on ec2
- Get the newly created ec2 public IP from step3
- Create inventory with custom hostname, ip, ansible user, and key to make ssh connection. (ref: ansible/inventory)
- Inventory hepls to connect to multiple instances
- To install initial packages on ec2 create a bash script (ref: ansible/install.sh)
- To create docker nginx image and run application container, create bash script (ref: start-docker.sh)
- Create ansible playbook yaml file which connect to ec2 instance, install all required packages using install.sh script, install docker, copy docker files and build and run the application (ref: deploy-nginx.yml)
```bash
ansible-playbook deploy-nginx.yml -i inventory
```

By using above steps, we can successfully create infrastructure on AWS, build the application using docker and deploy the application using ansible.
