PHONY: help
.DEFAULT_GOAL = help

cd = cd ~
sudo = sudo
install = $(sudo) apt install
update = $(sudo) apt update && apt upgrade

## install
PHONY: install
	$(cd)
	sudo apt install curl wget git make

## Thème
PHONY: terminal
	$(cd)
	$(install) zsh -y
	sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
	git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

PHONY: os
	$(sudo) apt-add-repository universe
	$(install) -y gnome-tweak-tool
	$(install) -y gnome-shell-extensions
	$(install) -y dconf-editor
	mkdir .themes
	mkdir .icon

## Tool
PHONY: docker
	$(update)
	$(install) apt-transport-https ca-certificates curl software-properties-common
	curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
	sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
	$(update)
	sudo apt-cache policy docker-ce
	$(install) -y docker-ce
	sudo systemctl status docker

PHONY: docker-compose
	sudo curl -L "https://github.com/docker/compose/releases/download/1.26.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
	sudo chmod +x /usr/local/bin/docker-compose
	sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

PHONY: portainer
	docker volume create portainer_data
	docker run -d -p 8000:8000 -p 9000:9000 --name=portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer


PHONY: node
	$(update)
	$(install) -y nodejs npm
	node -v
	sudo npm install --global yarn
	yarn --version

PHONY: php
	$(install) -y software-properties-common
	sudo add-apt-repository ppa:ondrej/php
	$(update)
	$(install) -y php8.0
	php -v
	$(install) openssl php-common php-curl php-json php-mbstring php-mysql php-xml php-zip

PHONY: composer:
	php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
	php -r "if (hash_file('sha384', 'composer-setup.php') === '906a84df04cea2aa72f40b5f787e49f22d4c2f19492ac310e8cba5b96ac8b64115ac402c8cd292b8a03482574915d1a8') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
	php composer-setup.php
	php -r "unlink('composer-setup.php');"
	sudo mv composer.phar /usr/local/bin/composer

## —— Others 🛠️️ ———————————————————————————————————————————————————————————————
help: ## Show help
	@grep -E '(^[a-zA-Z0-9_-]+:.*?##.*$$)|(^##)' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}{printf "\033[32m%-30s\033[0m %s\n", $$1, $$2}' | sed -e 's/\[32m##/[33m/'