#!/bin/bash
set -e  # Exit if any command fails

# Update system packages
echo "Updating system packages..."
sudo yum update -y

# Install Node.js and npm
if ! command -v node &> /dev/null
then
    echo "Installing Node.js..."
    curl -fsSL https://rpm.nodesource.com/setup_16.x | sudo bash -
    sudo yum install -y nodejs
fi

# Install PM2 for process management
echo "Installing PM2..."
sudo npm install -g pm2

# Navigate to project directory
cd /home/ec2-user/my-node-app || exit 1

# Install Node.js dependencies
echo "Installing project dependencies..."
npm install

# Ensure correct permissions
sudo chown -R ec2-user:ec2-user /home/ec2-user/my-node-app

echo "Setup completed!"
