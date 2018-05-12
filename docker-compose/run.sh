 cp ../target/spring-boot-sample-hateoas-2.0.1.RELEASE.jar .
#docker-compose up -d
#docker-compose exec db psql -U postgres -f /scripts/check.sql
docker build . -t docker-compose_rest
docker stack deploy --compose-file docker-compose.yml docker-compose_rest
docker service scale docker-compose_rest_rest=2
echo "Liberando porta 8090..."
docker service update --publish-add published=8090,target=8090 docker-compose_rest_rest
echo "Listando os serviços..."
docker service ls
