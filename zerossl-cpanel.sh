#!/bin/bash
#Auth: DOTRUNGQUAN.INFO
read -p "Nhap vao ten mien can cai: " domain
read -p "Nhao vao UserName cPanel: " user
read -p "Nhap vao Document Root: " document_root
wget -O - https://get.acme.sh | sh -s email=info@'domain'
source ~/.bashrc

/home/$user/.acme.sh/acme.sh --issue --webroot ~/"document_root" -d "$domain" -d www."$domain" --force
/home/$user/.acme.sh/acme.sh --deploy --deploy-hook cpanel_uapi --domain "$domain"  --domain www."$domain"
