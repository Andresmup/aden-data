# FILES FOR DATABASE

## Local db
```sh
sudo systemctl start docker
docker compose up
```

## Create db
```sh
createdb study-sync -h localhost -U postgres
```

## Connect
```sh
psql postgresql://postgres:password@localhost:5432/aden-db
```

## Create Schema
```sh
psql aden-db <db-files/schema.sql -h localhost -U postgres
```

## Insert fake data
```sh
psql aden-db <db-files/data.sql -h localhost -U postgres
```
