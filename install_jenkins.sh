#!/bin/bash

# Update system
sudo yum update -y

# Install Java 17 (required for Jenkins)
sudo yum install java-17-amazon-corretto -y

# Add Jenkins repository
sudo wget -O /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key

# Upgrade packages and install Jenkins
sudo yum upgrade -y
sudo yum install jenkins -y

# Enable and start Jenkins service
sudo systemctl enable jenkins
sudo systemctl start jenkins

# Display Jenkins initial admin password location
echo "Jenkins installation completed!"
echo "Initial admin password can be found at: /var/lib/jenkins/secrets/initialAdminPassword"

