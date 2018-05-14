### Tarefa 3 - Alta Disponibilidade - AWS - Amazon

### Pré-Requisitos

* 2 - Instâncias EC2 na AWS 
* Realizar os procedimentos da Tarefa 2

### Procedimentos

#### AWS - Cli

Procedimentos para instalação do AWS Cli.

```sh
apt install python-pip
pip install awscli --upgrade --user
```
Gerando chave de acesso: https://docs.aws.amazon.com/pt_br/IAM/latest/UserGuide/id_credentials_access-keys.html

Configurando a chave de acesso:

```sh
$ aws configure
AWS Access Key ID [None]: AKIAIOSFODNN7EXAMPLE
AWS Secret Access Key [None]: wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY
Default region name [None]: us-west-2
Default output format [None]: json
```

#### Load Balancer

Criando o load balancer na Amazon na porta 80 para porta 8090:

```sh
aws elb create-load-balancer --load-balancer-name my-load-balancer --listeners "Protocol=HTTP,LoadBalancerPort=80,InstanceProtocol=HTTP,InstancePort=8090" --availability-zones us-west-2a us-west-2b
```
Maiores informações: https://docs.aws.amazon.com/cli/latest/reference/elb/create-load-balancer.html

### Registrando Instâncias EC2

Comando para registrar a Instãncias EC2 no Load Balancer

```sh
aws elb register-instances-with-load-balancer --load-balancer-name my-load-balancer --instances i-d6f6fae3
```
Maiores informações: https://docs.aws.amazon.com/cli/latest/reference/elb/register-instances-with-load-balancer.html

Comando para remover a Instãncias EC2 no Load Balancer

```sh
aws elb deregister-instances-from-load-balancer --load-balancer-name my-load-balancer --instances i-d6f6fae3
```
Maiores informações: https://docs.aws.amazon.com/cli/latest/reference/elb/deregister-instances-from-load-balancer.html

### Procedimentos para atualização

- Remova uma instância EC2 do Load Balancer;
- Atualiza a instância removida;
- Adicione a instância removida;
- Repita o mesmo procedimento para outra instância EC2;
