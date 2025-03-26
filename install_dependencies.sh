#!/bin/bash
set -e

echo "Updating system and installing dependencies..."
sudo yum update -y
sudo yum install -y gcc-c++ make

# Install Node.js (LTS version)
curl -fsSL https://rpm.nodesource.com/setup_lts.x | sudo bash -
sudo yum install -y nodejs

# Install PM2 globally
sudo npm install -g pm2

echo "Dependencies installed."
