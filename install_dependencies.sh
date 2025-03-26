#!/bin/bash
set -e

echo "Updating system and installing dependencies..."
sudo yum update -y
sudo yum install -y gcc-c++ make


# Install NVM (Node Version Manager)
echo "Installing NVM..."
export NVM_DIR="/home/ec2-user/.nvm"
if [ ! -d "$NVM_DIR" ]; then
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.4/install.sh | bash
fi

# Load NVM into the shell
export NVM_DIR="/home/ec2-user/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

# Install Node.js (latest LTS version)
nvm install --lts
nvm use --lts

# Verify installation
echo "Node.js and npm installed:"
node -v
npm -v

# Install PM2 globally
echo "Installing PM2..."
npm install -g pm2

# Ensure correct PATH is set
echo "export NVM_DIR=\"/home/ec2-user/.nvm\"" >> /home/ec2-user/.bashrc
echo "[ -s \"$NVM_DIR/nvm.sh\" ] && \. \"$NVM_DIR/nvm.sh\"" >> /home/ec2-user/.bashrc
echo "export PATH=\"/home/ec2-user/.nvm/versions/node/$(nvm version)/bin:\$PATH\"" >> /home/ec2-user/.bashrc

echo "Dependencies installed successfully!"
