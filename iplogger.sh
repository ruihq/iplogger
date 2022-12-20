#!/bin/bash
apt update
apt upgrade 
apt install wget 
apt install figlet 
apt install unzip
clear

# Download ngrok
wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip

# Extract the ngrok executable
unzip ngrok-stable-linux-amd64.zip

# Get the client's IP address as a JSON object
ip_json=$(curl http://ip.jsontest.com/)

# Extract the IP address from the JSON object
ip=$(echo $ip_json | jq -r '.ip')

# Log the IP address to a file
echo $ip >> ip.log

# Make the ngrok executable executable
chmod +x ngrok  

# Get the authtoken and subdomain from the command line arguments
authtoken=$1
subdomain=$2

# Prompt the user for the authtoken and subdomain
read -p "Enter ngrok authtoken: " authtoken
read -p "Enter ngrok subdomain: " subdomain

clear
figlet IPLOGGER
# Host a website on a local server at port 8080 using ngrok and the specified authtoken and subdomain
./ngrok authtoken $authtoken
./ngrok http 8080 --subdomain=$subdomain

# Delete the ngrok zip after running
rm ngrok-stable-linux-amd64.zip

echo All ips are in the ip.log file.
echo To check them run this command "nano ip.log"



