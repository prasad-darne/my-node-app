#!/bin/bash
set -e

# Navigate to the application directory
cd /home/ec2-user/deploy || exit 1

echo "Installing dependencies..."
npm install -g pm2  # Install PM2 globally
npm install

# Start the application using PM2
echo "Starting the application..."
pm2 start index.js --name my-node-app

# Save PM2 process list to start on reboot
pm2 save
pm2 startup systemd

echo "Application started successfully!"
