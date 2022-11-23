# Day 3

## Manual Steps to create a Load Balancer

1. Create an Ubuntu Virtual Machine and a Red Hat Enterprise Linux Virtual Machine on azure portal that shares the same Virtual Network.
2. Install nginx on Ubuntu and RHEL VM.
3. Configure NSG in Azure Portal for Ubuntu VM to open up the ICMP(optional) and Http - Tcp/80 port(mandatory)
4. configure the RHEL VM to open up the port 80 using the below command
   sudo firewall-cmd --permanent --add-port=80/tcp --zone=public 
   sudo firewall-cmd --reload
   sudo firewall-cmd --list-all
5. From NSG inbound firewall configuration, open up the ICMP(Optional) port if you prefer to try out ping
6. Create a Standard, Regional LoadBalancer
7. Add Backend pool to the Standard Regional Loadbalancer
8. Add the Backend (Virtual Machines) to the Backend pool by selecting the virtual network used by Ubuntu and RHEL8 VMs.
9. Add an LoadBalancer Rule to forward all the traffic received by LB on port 80 to the backend port 80.
10. From your local machine, you should be able to access the LoadBalancer public IP at port 80/http.  You should be able to see the response coming from Ubuntu and RHEL8 nginx web server in a round-robin fashion.
