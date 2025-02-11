# Rasberi_Pi
Repo to host a hello world applicaiton on a rasberi pi. We want to get updates as required. set up cicd pipeline to upload code to the pi(or trigger pi to upload new container) handler requests from the AWS IoT Service

# Rasberi Pi Setup
Follow the steps below to properly set up the rasberi pi

# Installing the OS
1. Install the OS
Select the Rasberi Pi Os Lite (32 bit) from the pi installer for the Rasberi pi Zero W

2. Add in the required configuration settings. -> Make note of device specific information

3. Install the OS

4. Add Memory card to Pi

# SSH into Pi
1. Check pi ping: run the command `ping <Rasberi Pi Hostname>`

2. (If New Device with same name as an Old One): Clear Old SSH Key Pair run command in terminal `ssh-keygen -R <Rasberi Pi Hostname>`
Example: ssh-keygen -R pizero1.local

3. SSH into Rasberi pi `ssh <Specified Username>@<Rasberry pi Hostname>`


# Set Up Docker Manually - Setup 1A
Run the commands within your Rasberi pi(After you SSH into it)

## Install Docker and Update OS 

1. Update OS: `sudo apt update && sudo apt upgrade -y`

2. Install Docker: `sudo apt install -y docker.io`

## Allow Docker on boot

1. Enable docker on boot `sudo systemctl enable docker`

2. Start Docker on Boot `sudo systemctl start docker`

3. Verify Docker is Running: `sudo systemctl status docker`

## Allow Docker to be used without Sudo Command

1. Add Our User to the User group `sudo usermod -aG docker $USER`

2. In order for this to take effect, we must log out(exit) and Log back in(ssh back into the pi)

## Docker is now Set Up on your Pi 


# Setting up docker Automatically - Setup 1B
1. Open the setup.sh file `nano setup.sh`

2. Copy paste the following into the file and save it using Controll + X then Y then Enter

#!/bin/bash

exec > /tmp/setup_log.txt 2>&1

echo "Updating system..."
sudo apt update && sudo apt upgrade -y

echo "Installing Docker..."
sudo apt install -y docker.io

echo "Enabling Docker service..."
sudo systemctl enable docker
sudo systemctl start docker

echo "Adding user to Docker group..."
sudo usermod -aG docker $USER

echo "Setup complete. Reboot required."

3. Make it an executable: `chmod +x setup.sh`

4. Make a file to automate docker install when pi boots `sudo nano /etc/rc.local`

5. Copy paste the following into the file and save it using Controll + X then Y then Enter

bash /home/Adam1220/setup.sh &


6. Add functionality for docker to Pull and run specified base image on boot.



6. Hurray! You have now successfully automatically installed docker. It will now automatically install docker, enable docker on boot and add docker to the docker user group. We can now use docker. 

