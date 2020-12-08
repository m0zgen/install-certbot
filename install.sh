#!/bin/bash
# Created by Yevgeniy Goncharov, https://sys-adm.in
# https://certbot.eff.org/lets-encrypt/centosrhel7-nginx

# Install snapd
yum install snapd -y
systemctl enable --now snapd.socket
ln -s /var/lib/snapd/snap /snap

# Update snapd and install certbot
sudo snap install core; sudo snap refresh core
sudo snap install --classic certbot
sudo ln -s /snap/bin/certbot /usr/bin/certbot

# Simple help
echo -e "You can use these commands:\n"
echo "sudo certbot --nginx"
echo "sudo certbot certonly --nginx"

echo -e "Check automatic renewal:\n"
echo "sudo certbot renew --dry-run"

echo -e "You can find sheduled tasks in the lications:\n"
echo -e "
/etc/crontab/
/etc/cron.*/*
systemctl list-timers
"


