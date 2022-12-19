#!/bin/bash
sudo apt update
sudo apt upgrade
sudo apt install wget
sudo apt install figlet
clear
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

# Get the authtoken and subdomain from the command line arguments
authtoken=$1
subdomain=$2

# Host a website on a local server at port 8080 using ngrok and the specified authtoken and subdomain
./ngrok authtoken $authtoken
./ngrok http 8080 --subdomain=$subdomain

# Delete the ngrok zip after running
rm ngrok-stable-linux-amd64.zip

figlet IPLOGGERISON
echo All ips are in the ip.log file.
echo To check them run this command "nano ip.log"
echo Thank you.
echo The command must be runned using ./iplogger.sh YOUR_AUTHTOKEN



