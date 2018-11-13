#!/bin/bash

sudo ./lp-cota/lp-config.sh --generate-users-prints;

echo -n "Insert a quota: ";
read -a quota;
sudo ./lp-cota/lp-config.sh --quota $quota;

sudo g++ /lp-cota/lp.cpp -o /lp-cota/lp;

sudo chmod 4755 /lp-cota/lp;
sudo chmod 700 /lp-cota/lp-config.sh;
sudo chmod 700 /lp-cota/lp.sh;
sudo chown root:root /lp-cota/lp-config.sh;
sudo chown root:root /lp-cota/lp.sh;

lp_path=$(dirname `which lp`);
sudo mv $lp_path/lp $lp_path/lp-orig;
sudo chmod 700 $lp_path/lp-orig;

sudo mkdir /usr/lib/lp;
sudo ln -s /usr/lib/lp/lp $lp_path/lp;

echo "0 0 1 * * root ./usr/lib/lp/lp-config.sh --update" >> /var/spool/cron/contrabs/root;