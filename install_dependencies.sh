#!/bin/bash
set -e

echo "Updating system and installing dependencies..."
sudo yum update -y
sudo yum install -y gcc-c++ make

# Add Nodesource repo and install Node.js
echo "Setting up Node.js repository..."
curl -fsSL https://rpm.nodesource.com/setup_18.x | sudo bash -
sudo yum install -y nodejs

# Install PM2 globally
echo "Installing PM2..."
sudo npm install -g pm2

echo "Dependencies installed successfully."
