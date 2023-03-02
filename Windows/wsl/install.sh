apt-get update -y
apt-get upgrade -y

apt-get install \
      make curl git -y

## Config Git
git config --global user.name tmeunier
git config --global user.username tmeunier
git config --global user.email theo.meunier41@gmail.com
git config --global commit.autocrlf true

## Autorisation clé ssh
chmod 600 ~/.ssh/id_rsa
chmod 644 ~/.ssh/*.pub

## Installation Node - Npm - Yarn - Pmpn
curl -sL https://deb.nodesource.com/setup_18.x | sudo -E bash -
apt-get install nodejs -y
npm install -g yarn pnpm