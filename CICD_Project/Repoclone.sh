#!/bin/bash

# GitHub repository URL
REPO_URL="https://github.com/chaybonnada/Hero_CICD_Project.git"

# Directory where you want to clone the repository
DESTINATION="/user/chaitu/chaitu"

# Check if Nginx is installed
if ! command -v nginx &> /dev/null
then
    echo "Nginx is not installed."
else
    echo "Nginx is already installed."
    
    # Clone the latest code from the GitHub repository
    git clone "$REPO_URL" "$DESTINATION"
    
    # Restart Nginx
    sudo systemctl restart nginx
fi
