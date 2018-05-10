 cp ../spring-boot-sample-hateoas-2.0.1.RELEASE.jar .
docker-compose up -d
docker-compose exec db psql -U postgres -f /scripts/check.sqlrevresl