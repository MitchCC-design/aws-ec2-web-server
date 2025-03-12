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
