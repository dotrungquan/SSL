#!/bin/bash
#Auth: DOTRUNGQUAN.INFO
read -p "Nhap vao ten mien can cai: " domain
#read -p "Nhap vao Document Root: " document_root
wget -O - https://get.acme.sh | sh -s email=info@'domain'
source ~/.bashrc
/root/.acme.sh/acme.sh --issue -d "$domain" -d www."$domain" -w /www/wwwroot/"$domain" --force

rm -rf /www/server/panel/vhost/cert/$domain/*
ln -s /root/.acme.sh/$domain/fullchain.cer /www/server/panel/vhost/cert/$domain/fullchain.pem
ln -s /root/.acme.sh/$domain/$domain.key /www/server/panel/vhost/cert/$domain/privkey.pem
