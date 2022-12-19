#!/bin/bash
sudo apt update
sudo apt upgrade
sudo apt install wget
sudo apt install figlet
figlet IPLOGGER

# Get the client's IP address as a JSON object
ip_json=$(curl http://ip.jsontest.com/)

# Extract the IP address from the JSON object
ip=$(echo $ip_json | jq -r '.ip')

# Log the IP address to a file
echo $ip >> ip.log

# Download ngrok
wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip

# Extract the ngrok executable
unzip ngrok-stable-linux-amd64.zip

# Make the ngrok executable executable
chmod +x ngrok

# Host a website on a local server at port 8080 using ngrok
./ngrok http 8080

