#!/bin/bash
#Author: DOTRUNGQUAN.INFO
# Function to install SSL for main domain (option 1)
install_ssl_main_domain() {
    read -p "Enter your main domain (e.g., example.com): " main_domain
    wget -O - https://get.acme.sh | sh -s email=ssl@azdigi.info
    bash /home/*.acme.sh/acme.sh --issue --webroot ~/public_html -d $main_domain -d www.$main_domain --keylength 2048 --force
    bash /home/*.acme.sh/acme.sh --deploy --deploy-hook cpanel_uapi --domain $main_domain --domain www.$main_domain
}

# Function to install SSL for addon domain (option 2)
install_ssl_addon_domain() {
    read -p "Enter your addon domain (e.g., addon.com): " addon_domain
    wget -O - https://get.acme.sh | sh -s email=ssl@azdigi.info
    bash /home/*.acme.sh/acme.sh --issue --webroot ~/$addon_domain -d $addon_domain -d www.$addon_domain --keylength 2048 --force
    bash /home/*.acme.sh/acme.sh --deploy --deploy-hook cpanel_uapi --domain $addon_domain --domain www.$addon_domain
}

# Main script
echo "Select an option:"
echo "1. Install SSL for main domain"
echo "2. Install SSL for addon domain"
read -p "Enter option (1 or 2): " option

case $option in
    1)
        install_ssl_main_domain
        ;;
    2)
        install_ssl_addon_domain
        ;;
    *)
        echo "Invalid option. Please enter 1 or 2."
        ;;
esac
