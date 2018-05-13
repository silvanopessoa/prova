mvn install -U -f ../
cp ../target/spring-boot-sample-hateoas-2.0.1.RELEASE.jar .
docker build . -t docker-compose_rest
rm -rf dados
mkdir dados
docker stack deploy --compose-file docker-compose.yml docker-compose_rest
echo "Liberando porta 8090..."
docker service update --publish-add published=8090,target=8090 docker-compose_rest_rest
echo "Scale service API REST ..."
docker service scale docker-compose_rest_rest=2

echo "Listando os serviços..."
docker service ls
