FROM mysql:8-debian

RUN apt-get update && apt-get install -y wget unzip
RUN wget https://downloads.mysql.com/docs/world-db.zip
RUN unzip world-db.zip
RUN mv world-db/world.sql /docker-entrypoint-initdb.d/world.sql
