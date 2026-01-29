#!/bin/bash

# Shido Node Upgrade Script for v3.3.0 Upgrade
# This script automates the node upgrade process for the chain proposal at height 27200000

set -e  # Exit on any error

echo "============================================"
echo "    Shido Node Upgrade to TERA"
echo "============================================"
echo "Upgrade Height: 27200000"
echo ""

DOWNLOAD_URL="https://github.com/ShidoGlobal/shidochain-tera-upgrade/releases/download/tera/shidod"

echo ""
echo "============================================"
echo "Starting Upgrade Process"
echo "============================================"

# Step 1: Stop the node
echo "Step 1: Stopping shidod service..."
sudo systemctl stop shidod
echo "✓ Service stopped"

# Step 2: Remove the old binary
echo "Step 2: Removing old binary..."
sudo rm -f /usr/local/bin/shidod
echo "✓ Old binary removed"

# Step 3: Download the new binary
echo "Step 3: Downloading new shidod binary..."
cd $HOME
curl -L -o shidod $DOWNLOAD_URL
echo "✓ Binary downloaded"

# Step 4: Install and set permissions for new binary
echo "Step 4: Installing new binary..."
sudo mv shidod /usr/local/bin/
sudo chmod +x /usr/local/bin/shidod
echo "✓ New binary installed with proper permissions"

# Step 5: Verify the new version
echo "Step 5: Verifying new version..."
echo "New shidod version:"
/usr/local/bin/shidod version
echo "Expected output: 3.3.0"
echo "✓ Version verified"

# Step 6: Start the node
echo "Step 6: Starting shidod service..."
sudo systemctl restart shidod
echo "✓ Service started"

# Wait a moment for the service to initialize
echo "Waiting 5 seconds for service to initialize..."
sleep 5

# Check service status
echo "Checking service status..."
sudo systemctl status shidod --no-pager -l

echo ""
echo "============================================"
echo "Upgrade process completed successfully!"
echo "============================================"

# Step 7: Offer to monitor logs
echo ""
read -p "Would you like to monitor the logs now? (y/N): " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "Starting log monitoring (Press Ctrl+C to exit)..."
    sudo journalctl -u shidod -f --no-hostname -o cat
else
    echo "To monitor logs later, run: sudo journalctl -u shidod -f --no-hostname -o cat"
fi

echo "Upgrade script finished."
