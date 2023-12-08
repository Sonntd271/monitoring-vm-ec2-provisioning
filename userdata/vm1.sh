#! /bin/bash
# Wait for approximately 5 minutes to get everything running properly

vm_name="VM1"

echo "$vm_name" > /etc/hostname
sudo hostname "$vm_name"

# ----- Setup on Debian-based instances ----- #

sudo apt-get update -y
sudo apt install sysbench apache2 wget unzip -y
sudo apt update -y

sudo systemctl restart apache2
sudo systemctl enable apache2

# ----- Post-installation ----- #

cd /tmp
wget https://www.tooplate.com/zip-templates/2108_dashboard.zip
unzip 2108_dashboard.zip
sudo mv 2108_dashboard/* /var/www/html/
sudo systemctl restart apache2
cd