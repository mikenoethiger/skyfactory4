FROM openjdk:8-alpine

MAINTAINER Mike Noethiger <noethiger.mike@gmail.com>

WORKDIR /var/lib/skyfactory4

RUN apk add curl && \
	curl -LO https://media.forgecdn.net/files/2787/18/SkyFactory_4_Server_4.1.0.zip && \
    unzip SkyFactory_4_Server_4.1.0.zip && \
    mv SkyFactory_4_Server_4.1.0/* . && \
    rm SkyFactory_4_Server_4.1.0.zip && \
    ./Install.sh && \
    echo '\nexport MAX_RAM="2048M"' >> settings.sh && \
    ./settings.sh

CMD ["./ServerStart.sh"]
