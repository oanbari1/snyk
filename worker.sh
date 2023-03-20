#!/bin/bash

#Install EPEL release package
yum -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-9.noarch.rpm

# Install java, epel and utilities
yum install -y java-11-openjdk 

#enable root login in ssh configuration
sed -i "s/^PermitRootLogin no/PermitRootLogin yes/g" /etc/ssh/sshd_config
sed -i "s/^PasswordAuthentication no/PasswordAuthentication yes/g" /etc/ssh/sshd_config
service sshd restart

#Install git
yum install -y git

#Install docker and start service
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
yum install -y docker-ce docker-ce-cli containerd.io
systemctl start docker
systemctl enable docker

#Install terraform
yum install -y yum-utils
yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
yum install -y terraform


#Documentation to set up ssh with worker node on Jenkins
#ssh-keygen on master node
#ssh-copy-id to worker node
#add password to user to ssh to with passwd user command
#install terraform plugin and in jenkins globl tool config make installation directory  
#add aws credentials download CloudBee AWS credential plugin
#then add access key to jenkins credentials key id must be aws_credentals
