sudo apt update
yes | sudo apt install maven
yes | sudo apt install docker.io
yes | sudo apt-get install curl
sudo curl -L https://github.com/docker/compose/releases/download/1.21.2/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version
docker swarm init