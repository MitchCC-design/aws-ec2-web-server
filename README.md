# AWS EC2 Web Server  
### Automated Deployment of an Apache Web Server on Amazon Linux 2  

![AWS EC2](https://img.shields.io/badge/AWS-EC2-orange?style=flat-square&logo=amazon-aws)  
![Apache](https://img.shields.io/badge/Apache-HTTPD-red?style=flat-square&logo=apache)  
![Bash](https://img.shields.io/badge/Bash-Scripting-blue?style=flat-square&logo=gnu-bash)  
![GitHub](https://img.shields.io/badge/GitHub-Repository-lightgrey?style=flat-square&logo=github)  

## Project Overview  
This project automates the deployment of an **Apache Web Server (httpd) on an AWS EC2 instance using an AWS User Data script. It ensures that upon instance launch, the required packages are installed, the web server is started, and a basic webpage is deployed dynamically.

---

## Features  
Automated EC2 Web Server Setup – No manual configuration needed  
Apache Installation – Installs and configures `httpd` on Amazon Linux 2  
Auto-Start on Boot – Ensures the web server starts on every reboot  
Custom Webpage Deployment – Displays "Hello World" with the EC2 instance hostname  
Scalable & Secure – Easily repeatable in a production environment  

---

## Deployment Process  
### Launch an AWS EC2 Instance  
- Choose Amazon Linux 2 AMI  
- Select an appropriate instance type (e.g., `t2.micro`)  
- Configure security groups to allow HTTP traffic (port 80)  
- Add the provided User Data script  

### User Data Script (Automated Setup) 
This Bash script automatically configures Apache and deploys a webpage:  

```bash
#!/bin/bash
# AWS EC2 User Data Script - Automates Apache Web Server Setup

# Update system packages
yum update -y

# Install Apache (httpd) on Amazon Linux 2
yum install -y httpd

# Start Apache and enable it to run on startup
systemctl start httpd
systemctl enable httpd

# Create a simple "Hello World" webpage displaying the EC2 hostname
echo "<h1>Hello World from $(hostname -f)</h1>" > /var/www/html/index.html
