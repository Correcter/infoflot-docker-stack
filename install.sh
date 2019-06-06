#!/bin/bash

sudo true

sudo apt-get update

# Установим базовые зависимости, если есть такая необходимость

sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

# Добавим ключ авторизации репозитория Docker

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo apt-key fingerprint 0EBFCD88

# Добвим репозиторий stable

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

sudo apt-get update

# Установим Docker Community Edition

sudo apt-get install -y docker-ce

# Импортируем docker-compose

sudo curl -L https://github.com/docker/compose/releases/download/1.18.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose

# Добавим права исполнения

sudo chmod +x /usr/local/bin/docker-compose

# Linux post-install

sudo groupadd docker

sudo usermod -aG docker $USER

sudo systemctl enable docker

# Запустим билд из репозитория
# Состав сборки смотреть в readme.md

cd ~/

git clone https://github.com/Correcter/infoflot-docker-stack.git

cd ~/infoflot-docker-stack/app

docker-compose build

docker-compose --scale docker-compose up --scale dev-phalcon=1 dev-yii2=1 php=1 mariadb-haproxy=1 mariadb=2 redis=1

docker-compose up