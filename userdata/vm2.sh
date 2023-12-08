#! /bin/bash
# Wait for approximately 5 minutes to get everything running properly

vm_name="VM2"

echo "$vm_name" > /etc/hostname
sudo hostname "$vm_name"

# ----- Setup on Debian-based instances ----- #

sudo apt-get update -y
sudo apt install apache2-utils -y
sudo apt update -y