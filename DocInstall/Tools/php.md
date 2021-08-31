# Installtion PHP

## 1 - mettre a jour l'os
```shell
sudo apt update
sudo apt upgrade
```

## 2 - Installer PHP PPA Répository
```shell
sudo apt -y install software-properties-common
sudo add-apt-repository ppa:ondrej/php
```

## 3 - Installer PHP
```shell
sudo apt update
sudo apt upgrade

sudo apt -y install php8.0
php -v
```

## 4 - Installer les Extentions php

- Liste modules/extentions php
```shell
php -m
```

- Installer les extention
```shell
sudo apt install php8.0-<extension>
```