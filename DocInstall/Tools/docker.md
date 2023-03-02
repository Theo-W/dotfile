## Installation docker et portainer

### 1 - Mettre à jour / installation des packages
```shell
sudo apt-get update

sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
```

### Ajouts de la Clé GPG
```shell
sudo mkdir -m 0755 -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
```

### Installation et configuration du repository
```shell
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
```

### Petite mise à jout
````shell
sudo apt-get update
````

### Installation de docker et les outils
```shell
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```

## Ajout des droits sur docker
```shell
sudo usermod -aG docker ${USER}
su - ${USER}
id -nG
```

## Installtion portainer

### 1 - Crée un volume docker
```shell
docker volume create portainer_data
```

### 2 - Lancer le container docker
```shell
docker run -d -p 8000:8000 -p 9000:9000 --name=portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer
```