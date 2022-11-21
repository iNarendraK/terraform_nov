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
