mvn install -U -f ../../
cp ../../target/spring-boot-sample-hateoas-2.0.1.RELEASE.jar .
docker build . -t docker-compose_rest
docker stack deploy --compose-file docker-compose.yml docker-compose_rest
echo "Listando os serviços..."
docker service ls
