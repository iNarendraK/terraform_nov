# Day 4

## What is Azure App Service?
- Platform as a Service (PaaS) from Azure that takes care of Virtual Machines, Storage, Load Balancer, etc required for your web application
- provides environment where any web application can be deployed
    - python
    - C#(.Net)
    - Spring-Boot
    - NodeJS
    - ReactJS
- supports scale up/down of your application
- support CI/CD for your application based GitHub Actions, etc.,
- takes cares of infrastructure
  - compute resource ( Azure Virtual Machine )
  - creating a service plan 
  - Hosting 
    - Linux
    - Windows 
- allows to choose your, the type of Virtual Machine and its configuration, etc.,


## What is Configuration Management Tool?
- helps in automating software installations and configurations
- once a physical machine or virtual machine or a cloud virtual machine is provisioned with some OS, configuration management tools can be used to automate further software installation and complex configurations
- Examples:
  - Puppet
  - Chef
  - Salt/SaltStack
  - Ansible

## What is Ansible ?
- agentless
- doesn't follow client-server architecture unlike Puppet/Chef
- comes in 2 flavours
  - Ansible Core ( OpenSource )
  - Red Hat Ansible Tower ( For commercial use ) 
    - developed on top of Ansible Core
    - Red Hat(an IBM company ) provides wordwide support

#### What is an inventory file?
- is a text file
- that captures node connection details like SSH connection details, RDP connection details

#### What is Ansible Playbook?
- is a YAML file that has declarative code that expresses the desired state of an Ansible Node after running the playbook

#### What is Ansible Controller Machine (ACM) ?
- the machine where Ansible is installed is called Ansible Controller Machine
- Ansible Playbooks are exectuted from the Ansible Controller Machine to automate software installations

#### What is Ansible Nodes?
- This could be a
  - Physical Machine 
  - Local/Remote Virtual Machine
  - a Cloud Virtual Machine
  - container
- These are the machine where software installation and configuration will be done by Ansible
- Unix/Linux/Mac based Ansible Node
  - Software requirements
    - SSH Server should installed and running
    - Python should be there
- Windows based Ansible NOde
  - Software requirements
    - WinRM should be configured and activated
    - PowerShell should be there 
    
#### What is Ansible Module?
- Ansible Module are Python scripts that helps the Ansible Playbook in automating software installations/configurations in Unix/Linux/Mac based Ansible Nodes
- Ansible Module are Powershell scripts that helps the ansible playbook in automating software installations/configurations in Windows based Ansible nodes

#### What is adhoc ansible command?
- For trivial things like find an IP address of an ansible node or to quickly if a particular service is running we don't typically write a Playbook instead will invoke a single Ansible module which is called Ansible ad-hoc command
Example:-
  ansible -i hosts all -m ping
  ansible -i hosts -m shell -a "service status nginx"
  ansible -i hosts -m shell -a "ifconfig"
