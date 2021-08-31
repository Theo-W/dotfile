# Installation Composer

Composer est le gestion des packages pour php

- Pour avoir composer ils vous faut php
- Excuter les commandes suivante pour installer composer 
```shell
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('sha384', 'composer-setup.php') === '795f976fe0ebd8b75f26a6dd68f78fd3453ce79f32ecb33e7fd087d39bfeb978342fb73ac986cd4f54edd0dc902601dc') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php # voir https://stackoverflow.com/a/56710293/6614155
php -r "unlink('composer-setup.php');"
```
- Vérifize que Composer est bien installer 
```shell
Composer --version
```
- Si il ne trouve pas composer essayer 
```shell
php composer.phar
```
- Nous pouvons crée un Alias
```shell
alias composer='php ~/composer.phar'
```

