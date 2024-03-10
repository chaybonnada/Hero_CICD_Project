#!/bin/bash

# GitHub repository URL
REPO_URL="https://github.com/chaybonnada/Hero_CICD_Project.git"

# Directory where you want to clone the repository
DESTINATION="/user/chaitu/chaitu"

# Check if Nginx is installed
if ! command -v nginx &> /dev/null; then
    echo "Nginx is not installed."
    exit 1
fi

# Clone the latest code from the GitHub repository
git clone "$REPO_URL" "$DESTINATION"

# Check if clone was successful
if [ $? -ne 0 ]; then
    echo "Failed to clone code."
    exit 1
fi

# Restart Nginx
sudo systemctl restart nginx

# Check if Nginx restart was successful
if [ $? -ne 0 ]; then
    echo "Failed to restart Nginx."
    exit 1
fi

echo "Code cloned and Nginx restarted successfully."
exit 0