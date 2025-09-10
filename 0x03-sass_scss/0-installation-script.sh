#!/bin/bash

# Installation Script for SASS version 3.7.4
# Mac Specific Installation Script

# Function to install Node.js and npm using Homebrew
install_node() {
    echo "Installing Node.js and npm..."
    brew install node
}

check_versions() {
    echo "--------------------"
    echo "Installed versions:"
    if command -v node &> /dev/null; then
        echo "Node.js: $(node --version)"
    else
        echo "Node.js: Not installed"
    fi
    if command -v npm &> /dev/null; then
        echo "npm: $(npm --version)"
    else
        echo "npm: Not installed"
    fi
    echo "--------------------"
}

# Step 1: Check if Node.js is installed
echo "Checking Node.js installation..."
if ! command -v node &> /dev/null; then
    echo "Node.js is not installed."
    read -p "Would you like to install Node.js? (y/n): " choice
    if [ "$choice" = "y" ] || [ "$choice" = "Y" ]; then
        install_node
    else
        echo "Cannot proceed without Node.js. Exiting..."
        exit 1
    fi
else
    # Verify installation with version check
    check_versions
fi

# Step 3: Install Latest SASS version
echo "Installing Latest SASS version..."
npm install sass -v 3.7.4

# Step 4: Verify installation
echo "Verifying SASS installation..."
npx sass --version

echo "SASS installation complete!"
