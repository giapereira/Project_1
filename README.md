## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

!(Project_1/Images/Network_Diagram.png)

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the YAML file may be used to install only certain pieces of it, such as Filebeat.

  - !ELK Install(Project_1/Ansible/install-elk.yml)
  - !Filebeat Playbook(Project_1/Ansible/filebeat-config.yml)
  - !Metricbeat Playbook(Project_1/Ansible/metricbeat_config.yml)

This document contains the following details:
- Description of the Topology
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly accessible, in addition to restricting traffic to the network.The purpose of a Load Balancer is to protect Azure servers from the posibility of becoming inaccessible due to high volumes of traffic. The Load Balancer is capable of directing traffic to servers based on their available computing power. 

The advantage of a Jump Box is its ability to shield VMs from potential exposure to threats from the public, by acting as the secured main entrypoint to a network and reducing the attack surface.

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the logs and system traffic.

Filebeat is, according to the elastic.co website, a lightweight shipper for forwarding and centralizing log data. It is installed onto servers as an agent, and monitors log files and specified location to collect and forward to Elasticsearch to be indexed. 

Metricbeat, on the other hand, collects metrics from a server's OS and services and ships these statistics to a specified output for collection. 

The configuration details of each machine may be found below.

| Name     | Function | IP Address | Operating System |
|----------|----------|------------|------------------|
| JumpBox  | Gateway  | 10.0.0.1   | Linux            |
| Web-1    |    VM    | 10.0.0.5   | Linux            |
| Web-2    |    VM    | 10.0.0.6   | Linux            |
| DVWA-VM3 | Training | 10.0.0.9   | Linux            |
| ELK-VM   |Monitoring| 10.1.0.4   | Linux            |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the JumpBox machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
- My personal device at 99.238.244.126
- And Port 5601 which has been opened for connections from Kibana

Machines within the network can only be accessed by connecting to the JumpBoxProvisioner VM by way of SSH.
- JumpBoxProvisioner at 10.0.0.1

A summary of the access policies in place can be found in the table below.

| Name     | Publicly Accessible | Allowed IP Addresses |
|----------|---------------------|----------------------|
| JumpBox  | Yes                 | 99.238.244.126       |
| Web-1    | No                  | 10.0.0.1/254         |
| Web-2    | No                  | 10.0.0.1/254         |
| DVWA-VM3 | No                  | 10.0.0.1/254         |
| ELK-VM   | No                  | 10.0.0.1/254         |

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because this prevents the likelihood of human error when manually enterin configurations to a system. 

The playbook implements the following tasks:
- Installation of docker.io
- Installation of pip3
- Installation of python module
- Increase of virtual memory
- Download of Docker container
- Launch of a Docker container
- Enable service on Docker

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

!(Project_1/Images/Docker_PS.png)

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
 - Web-1 at 10.0.0.5
 - Web-2 at 10.0.0.6

We have installed the following Beats on these machines:
- Filebeat
- Metricbeat

These Beats allow us to collect the following information from each machine:
- Filebeat collects and indexes log data which is then sent to and processed by a monitoring cluster.
- Metricbeat collects metrics and statistics about the server itslef, and sends results to the desired output

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the playbook file to ansible.
- Update the host file to include both Web Server and ELK Server
- Run the playbook, and navigate to Kibana to check that the installation worked as expected.

- Which file is the playbook? Where do you copy it? 
The file is install-elk.yml, and it is located in the /etc/ansible folder.
- Which file do you update to make Ansible run the playbook on a specific machine? How do I specify which machine to install the ELK server on versus which to install Filebeat on?
You are to update the hosts file in the /etc/ansible folder to have Ansible run this playbook on a specified machine. By specifying the IP addresses of certain machines under certain groupings within the hosts file and reflecting those same groups within the playbook YAML file, you can control which machines install either ELK or Filebeat. 
- Which URL do you navigate to in order to check that the ELK server is running?
http://52.175.233.76:5601/app/kibana

- Specific commands in order to download playbook:
$ sudo nano ansible.cfg
Add the specified server IPs and ansible_python_interpreter=/usr/bin/python3 to the host
Ctrl + x to save the file and exit
Assuming you are in the directory containing install-elk.yml, run: 
$ cp ElkPlaybook.yml /etc/ansible
$ sudo nano install-elk.yml /etc/ansible
name: installing elk hosts: [IP address of desired machine, or hosts file grouping name]
Ctrl + x to save the file and exit
$ ansible-playbook install-elk.yml