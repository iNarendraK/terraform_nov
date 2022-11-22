# Day 2

## Changing the permission of pem file
```
chmod 400 ~/Downloads/ubuntu-vm1.pem
ssh -i ~/Downloads/ubuntu-vm1.pem azureuser@<public-ip-of-your-vm>
```

## Installing nginx web server in the Azure Ubuntu virtual machine
```
sudo apt update
sudo apt install -y nginx
sudo systemctl start nginx
curl localhost
```

## Firewall configuration

![Network Security Group](nsg.png)


## Lab - Creating an Ubuntu Virtual Machine using Terraform
```
cd ~/terraform-nov-2022
git pull

cd Day2/azure-vm
terraform init
terraform apply --auto-approve
```
