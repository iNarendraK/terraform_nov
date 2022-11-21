# Day 1

## Installing Terraform in Ubuntu (Do this from your RPS Ubuntu Terminal )
```
wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg

echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list

sudo apt update && sudo apt install terraform
```

Checking if Terraform is installed properly
```
terraform version
terraform
```

Expected output

<pre>
<b>jegan@tektutor.org</b>:~/terraform-oct-2022$ <b>terraform version</b>
Terraform v1.3.2
on linux_amd64
<b>jegan@tektutor.org</b>:~/terraform-oct-2022$ <b>terraform</b>
Usage: terraform [global options] <subcommand> [args]

The available commands for execution are listed below.
The primary workflow commands are given first, followed by
less common or more advanced commands.

Main commands:
  init          Prepare your working directory for other commands
  validate      Check whether the configuration is valid
  plan          Show changes required by the current configuration
  apply         Create or update infrastructure
  destroy       Destroy previously-created infrastructure

All other commands:
  console       Try Terraform expressions at an interactive command prompt
  fmt           Reformat your configuration in the standard style
  force-unlock  Release a stuck lock on the current workspace
  get           Install or upgrade remote Terraform modules
  graph         Generate a Graphviz graph of the steps in an operation
  import        Associate existing infrastructure with a Terraform resource
  login         Obtain and save credentials for a remote host
  logout        Remove locally-stored credentials for a remote host
  output        Show output values from your root module
  providers     Show the providers required for this configuration
  refresh       Update the state to match remote systems
  show          Show the current state or a saved plan
  state         Advanced state management
  taint         Mark a resource instance as not fully functional
  test          Experimental support for module integration testing
  untaint       Remove the 'tainted' state from a resource instance
  version       Show the current Terraform version
  workspace     Workspace management

Global options (use these before the subcommand, if any):
  -chdir=DIR    Switch to a different working directory before executing the
                given subcommand.
  -help         Show this help output, or the help for a specified subcommand.
  -version      An alias for the "version" subcommand.
</pre>


## Install Microsoft Visual Studio code editor
```
sudo snap install code --classic
```

Launching the visual studio code editor from your Ubuntu terminal
```
cd ~

code .
```

## Installing git, tree and vim
```
sudo apt update && sudo apt install -y git tree vim
```

## Cloning TekTutor GitHub Repository for this training
```
cd ~
git clone https://github.com/tektutor/terraform-nov-2022.git
cd terraform-nov-2022
code .
```

## What is Dual/Multi-booting?
- Let's say you have a laptop with Windows 10 Pro preinstalled, but you need Ubuntu for some R&D purpose.
- You can use some Boot Loaders ( LILO or GRUB 2 )
- Boot loader is a small system utility that is installed on the MBR(Mast Boot Record) i.e sector 0 byte in your Hard Disk ( 512 bytes )

## Virtualization Technology
- Helps us run many OS side by side on the same system
- i.e Many OS can be actively running on the laptop/desktop/workstation/server
- Primary Operating System on which the Hypervisor software is installed is called Host OS
- The Operating System that runs within the Virtual Machine are referred as Guest OS.
- The number of OS ( Host & Guest OS ) that can be active at the same time depends on the hardware configuration of your laptop/server.
- Processor ( Intel / AMD )
  - multiple CPU Cores
- RAM
- Storage
- Virtualization technology helps us in consolidating many physical servers to a single Physical Server

## What is Virtual Machine(VM)?
- aka Guest OS
- the Guest OS get its own dedicated hardware resources
  - CPU Cores
  - RAM
  - Storage
- it is fully functional Operating system with its own OS Kernel

## What is container virtualization?
- it is an application virtualization technology
- each container represents one single application 
- container doesn't represent Operating Systems
- 1 container represents one process within an OS
- container will not able to replace virtual machine
- containers runs in its own virtual sandbox environment called namespace
- every container get its own Network Stack
- every container get's an IP Address
- every container also get's a file system
- containers don't get their own dedicated hardware resources, they share the hardware resources available on the underlying OS where the containers runs, hence it is a lightweight virtualization technology

## Linux Kernel Features that enable Container Technology
1. Namespace
   - helps in isolating one container from another
2. Control Group (CGroup)
   - helps in applying some resource quoto restrictions
   - example:-
     - a container can restricted to access only 50% CPU ( let's your laptop has Quad Physical Cores ie 8 Virtual Cores )

## Container Softwares
- Docker
- Podman
- Rkt ( pronounced as Rocket )
- LXC
- Containerd
- CRI-O

## What is a Container Runtime ?
- is a low-level container management tool used by Container Engines
- generally end-users never this directly
- Examples
  - runC 
  - CRI-O

## What is a container Engine ?
- a high-level software used by end-users like us to create/manage container and images
- container engine provides user-friendly commands to create and manage containers/images
- container engines depends on container runtime to create and manage containers
- Examples
  - Docker
  - Podman
- Docker depends on containerd which in-turn depends on runC Container Runtimes
- Podman depends on CRI-O container Runtime

## Installing Docker in Ubuntu
```
sudo apt-get update
sudo apt-get install ca-certificates curl gnupg lsb-release
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
  
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin
sudo systemctl enable docker
sudo systemctl start docker
sudo systemctl status docker
sudo usermod -aG docker $USER
newgrp docker
docker --version
docker images
```

## Finding details about your docker installation
```
docker info
```

## Downloading a container image from Docker Remote Registry ( Docker Hub website to your Local Docker Registry[/var/lib/docker]
```
docker pull nginx:latest
```

## Listing the docker images on your Local Docker Registry
```
docker images
```

## What is datacenter?
- a group of servers owned an organization which are co-located in a single physical location
- Mumbai (Region)
  - Availability Zone ( 2 locations )
  - 
- Bengaluru (Region)
  - Whitefield ( Availability Zone )
  - Electronic City ( Availability Zone )

## What is Cloud Computing?

## Different types of Cloud
1. Public Cloud
  - Amazon AWS, Microsoft Azure, Google GCP, Digital Ocean, etc.,
  - We can provision infrastructure, storage and network services from AWS
  - We can provision and use a Virtual Machine on the cloud
  
2. Private Cloud
- smartly connect all the datacenter servers in a way they can be access from internet, and you can create virtual machine of different size and capacity ( you can choose no of CPU cores, RAM size, Storage size, even you can resize them after creating the virtual machines )

3. Hybrid Cloud
- a combination of Private Data center and Public Datacenter


## What are different types of cloud services ?
1. Infrastructure as a Service (IaaS)
2. Platform as a Service (PaaS)
3. Software as a Service (SaaS)


## What is Terraform ?
- Infrastructure as a Code (IaaC) software
- we can automate the infrastructure management
- Example
  - we can automate - provision virtual machine in onPrem servers, public cloude, etc.,
  - we can automate - software installation on the provisioned virtual machines locally or on cloud
- Terraform is cloud newtral IaaC software ie it can automate infrastruce on private, public or hybrid cloude independent of whether it is AWS/Azure/GCP, etc.,

## What is Cloudformation ?
- Cloudformation is a Infrastructure as a Code (Iaac) software from AWS
- it helps us automate the infrastructure within AWS 
