#!/bin/bash

# vars
regruUser="user@gmail.com" # user
regruPass="PassWord" # user's pass
domain="domain.com" # domain for cert create
subdomain="_acme-challenge" # subdomain "_acme-challenge", don't change it
letsencryptServer="https://acme-v02.api.letsencrypt.org/directory" # letsencrypt server url
email="user@gmail.com" # email for notifies

# certbot run
certbot -v certonly --manual --preferred-challenges=dns --manual-auth-hook "./regru-add.sh $regruUser $regruPass $subdomain $domain" \
    --manual-cleanup-hook "./regru-del.sh $regruUser $regruPass $subdomain $domain" -d *.$domain -d $domain --email=$email \
    --server $letsencryptServer --agree-tos --non-interactive --manual-public-ip-logging-ok --force-renewal #--dry-run
