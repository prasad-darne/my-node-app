#!/bin/bash
set -e

# Navigate to the application directory
cd /home/ec2-user/my-node-app || exit 1

# Start the application using PM2
echo "Starting the application..."
pm2 start index.js --name my-node-app

# Save PM2 process list to start on reboot
pm2 save
pm2 startup systemd

echo "Application started successfully!"
