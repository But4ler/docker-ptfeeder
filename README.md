# docker-ptfeeder

For run direcly with docker:

```console
docker run -d -p 5010:5010 -v ./${PATH_PROFIT_TRAILER}:/mnt/profittrailer -v ./ptfeeder01:/app/ptf --name ptfeeder01 but4ler/docker-ptfeeder
```

# Docker-compose
for run with docker-compose (best methode)

vi docker-compose.yml

```yml
version: '3'
services:
  pt01:
    image: but4ler/profit-trailer:latest
    restart: always
    volumes:
      - ./pt01:/app/ProfitTrailer
    ports:
      - "8081:8081/tcp"
    network_mode: host

  ptfeeder01:
    image: but4ler/docker-ptfeeder:latest
    restart: always
    ports:
      - "5010:5010"
    volumes:
      - ./pt01:/mnt/profittrailer
      - ./ptfeeder01:/app/ptf     
    network_mode: host

```

```console
docker-compose up -d
```