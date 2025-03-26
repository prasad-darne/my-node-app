#!/bin/bash
set -e

APP_DIR="/home/ec2-user/deploy"

echo "Navigating to application directory..."
cd $APP_DIR

# Manually source NVM
export NVM_DIR="/home/ec2-user/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"

# Ensure the correct Node.js version is used
nvm use --lts

echo "Stopping any existing PM2 process..."
pm2 stop node-app || true

echo "Installing application dependencies..."
npm install

echo "Starting application with PM2..."
pm2 start index.js --name node-app

echo "Saving PM2 process list..."
pm2 save

echo "Enabling PM2 to start on reboot..."
pm2 startup systemd
sudo env PATH=$PATH:/usr/bin pm2 startup systemd -u ec2-user --hp /home/ec2-user
sudo systemctl enable pm2-ec2-user
sudo systemctl start pm2-ec2-user

echo "Application started successfully!"
