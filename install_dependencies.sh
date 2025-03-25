#!/bin/bash
set -e

echo "Updating system and installing dependencies..."
sudo yum update -y
sudo yum install -y gcc-c++ make
sudo yum install -y nodejs
sudo npm install -g pm2

echo "Dependencies installed."
