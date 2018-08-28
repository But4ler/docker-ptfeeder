# docker-ptfeeder

For run direcly with docker:

```console
docker run -d -p 5010:5010 -v ./${PATH_PROFIT_TRAILER}:/mnt/profittrailer -v ./ptdefender:/headless/.config/PTDefender --name ptdefender ptdefender
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

  ptf01:
    image: but4ler/docker-ptfeeder:latest
    restart: always
    ports:
      - "5010:5010"
    volumes:
      - ./pt01:/mnt/profittrailer
      - ./ptfeeder:/app/ptf     
    network_mode: host

    network_mode: host

```

```console
docker-compose up -d
```