#!/bin/bash

REPO_URL="https://github.com/swft-blockchain/test-devops-1.git"
REPO_DIR="test-devops-1"

#Check if Git is installed or Not 
#OS="$(uname -s)"
detect_git_package_present(){
 if command -v git &>/dev/null && command -v git &>/dev/null; then
        echo "[INFO] git already installed: $(node -v)"
        echo "[INFO] git version: $(git --version)"
        return
    fi
}
detect_git_package_present

# Step 1: Clone or update the repository
if [ -d "$REPO_DIR/.git" ]; then
    echo "[+] Repository exists. Pulling latest changes..."
    cd "$REPO_DIR" && git pull
else
    echo "[+] Cloning repository..."
    git clone "$REPO_URL" "$REPO_DIR"
    cd "$REPO_DIR" || { echo "Failed to enter directory"; exit 1; }
fi

# Step 2: Make scripts executable
echo "[+] Granting execution permissions..."
chmod +x setup.sh start.sh

# Step 3: Run setup.sh
echo "[+] Running setup.sh..."
./setup.sh

echo "Setup is completed"