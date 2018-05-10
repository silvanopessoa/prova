docker-compose up -d
docker-compose exec db psql -U postgres -f /scripts/init.sql
docker-compose exec db psql -U postgres -f /scripts/check.sql