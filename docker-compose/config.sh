sudo apt update
# https://askubuntu.com/questions/971059/17-10-openjdk-and-oracle-jdk-8-and-9-the-trustanchors-parameter-must-be-non-empt?utm_medium=organic&utm_source=google_rich_qa&utm_campaign=google_rich_qa
# yes | sudo apt purge openjdk-11-jdk openjdk-8-jdk java-common
sudo apt install openjdk-8-jdk
yes | sudo apt install maven
yes | sudo apt install docker.io
yes | sudo apt-get install curl
sudo curl -L https://github.com/docker/compose/releases/download/1.21.2/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version
docker swarm init