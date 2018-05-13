### Pré-requisitos
Ubuntu 18.04 LTS

Instalar o git

```sh
sudo apt install git
```


### Clone do Projeto

Para configurar o ambiente execute os seguintes comandos:

```sh
git clone https://github.com/silvanopessoa/prova.git
cd prova
git checkout tarefa2
cd docker-compose
chmod +x *.sh
```
### Configurando o Ambiente

Para configurar o ambiente basta executar o comando abaixo:

```sh
sudo ./config.sh
```

### Executando o Projeto

Para executar o projeto basta executar o comando abaixo:

```sh
sudo ./run.sh
```

### BUG Docker
Caso a aplicação não suba na primeira tentativa rode mais uma vez o script:

```sh
sudo ./run.sh
```
BUG - https://forums.docker.com/t/dockerswarm-mode-with-postgres-fail-only-with-persistent-storage/29498/2

### Alta Disponibilidade

AWS

Normalmente criou um Job no Jenkins que adiciona e remove instância atravês dos comandos no aws cli

apt install python-pip
pip install awscli --upgrade --user

https://docs.aws.amazon.com/cli/latest/reference/elb/create-load-balancer.html
https://docs.aws.amazon.com/cli/latest/reference/elb/deregister-instances-from-load-balancer.html
https://docs.aws.amazon.com/cli/latest/reference/elb/register-instances-with-load-balancer.html


