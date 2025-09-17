#!/bin/bash

# ===============================================
# Automated Idempotent Environment Setup Script
# For the EMS Equity Trading System
# ===============================================

# -----------------------------------------------
# 1. Define Project and Repository Variables
# -----------------------------------------------
# The project root on your local machine
PROJECT_ROOT="/home/mhamilton/dev-projects/ems-equity-trading"
# The GitHub repository URL for the project
GITHUB_REPO_URL="https://github.com/your-organization/ems-equity-trading.git"

# -----------------------------------------------
# 2. Check Prerequisites and Clone Repository
# -----------------------------------------------
# Check if git is installed
if ! command -v git &> /dev/null; then
    echo "Error: 'git' is not installed. Please install git and re-run this script."
    exit 1
fi

# Check if the project directory exists
if [ ! -d "$PROJECT_ROOT" ]; then
    echo "Project directory not found. Creating and cloning the repository..."
    
    # Create the parent directory if it doesn't exist
    mkdir -p /home/mhamilton/dev-projects

    # Clone the repository into the new directory
    git clone "$GITHUB_REPO_URL" "$PROJECT_ROOT"
    
    # Check if the clone was successful
    if [ $? -ne 0 ]; then
        echo "Error: Failed to clone the repository. Please check the URL and your network connection."
        exit 1
    fi
else
    echo "Project repository already exists at $PROJECT_ROOT. Skipping clone."
fi

# -----------------------------------------------
# 3. Navigate into the Project Directory
# -----------------------------------------------
echo "Navigating to the project directory: $PROJECT_ROOT"
cd "$PROJECT_ROOT"

# Check if the directory change was successful
if [ $? -ne 0 ]; then
    echo "Error: Failed to navigate to the project directory."
    exit 1
fi

# -----------------------------------------------
# 4. Final Success Message
# -----------------------------------------------
echo "✅ Environment setup complete. You are now in the project root directory."
echo "You can now run 'docker-compose up -d' to start the local infrastructure."
