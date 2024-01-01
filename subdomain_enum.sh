#!/bin/bash

# Website Reconnaissance Bash Script with Subdomain Enumeration

# Check if a domain is provided as an argument
if [ -z "$1" ]; then
    echo "Usage: $0 <domain>"
    exit 1
fi

domain=$1

echo "----- Performing Subdomain Enumeration -----"

# Subfinder
subfinder_output=$(subfinder -d $domain -silent)

# Amass
amass_output=$(amass enum -d $domain -silent)

# Assetfinder
assetfinder_output=$(assetfinder --subs-only $domain)

# Sublist3r
sublist3r_output=$(python3 /path/to/Sublist3r/sublist3r.py -d $domain -t 10 | grep -v "[-]")

# Combine results and sort
all_subdomains=$(echo -e "$subfinder_output\n$amass_output\n$assetfinder_output\n$sublist3r_output" | sort -u)

echo -e "\nSubdomains found:"
echo "$all_subdomains"

echo -e "\n----- Script Completed -----"
