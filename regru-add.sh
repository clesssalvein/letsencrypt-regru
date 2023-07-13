#!/bin/bash


# VARS

regruApiUrl="https://api.reg.ru/api/regru2/zone/add_txt"
regruUser=$1
regruPass=$2
TXT_SUBDOMAIN=$3
TXT_DOMAIN=$4


# START

curl -X POST "$regruApiUrl?input_format=json&output_content_type=plain&password=$regruPass&username=$regruUser&dname=$TXT_DOMAIN&subdomain=$TXT_SUBDOMAIN&text=$CERTBOT_VALIDATION";

# wait for dns entry create
sleep 300
