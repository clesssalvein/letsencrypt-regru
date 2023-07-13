## **About**

Script for automatically get "Let's Encrypt" wildcard domain certificate at CentOS, using delegated NS server at REG.RU

## **Requirements**

* Domain for which we want get wildcard letsencrypt certificate **(Domain's name servers (NS) should be delegated to DNS server at REG.RU)**
* At REG.RU DNS service there must be A record containing domain, for which we need to get certificate
* AlmaLinux 8
* certbot >= 1.11.0

## **Installation**

* At AlmaLinux 8
  ```
  dnf install -y epel-release
  ```
  ```
  dnf install -y git certbot
  ```
  ```
  cd /opt/
  ```
  ```
  git clone https://github.com/clesssalvein/letsencrypt-regru.git
  ```

## **Usage**
* Edit variables in "start.sh"
* Run ```./start.sh```

## **How it works**
* "start.sh" contains variables and starts certbot with auth script "regru-add.sh", which put to REG.RU dns server TXT entry with certbot validation string
* certbot validates text string
* after successfull validation certbot generates a certificate and downloads it to the local directory /etc/letsencrypt
* "regru-del.sh" delete TXT entry with certbot validation string at REG.RU dns server
