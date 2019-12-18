FROM azul/zulu-openjdk-alpine:8

ADD installers /installers
ADD start.sh /start.sh
RUN  apk add --no-cache --virtual=build-dependencies curl git bash&&\
addgroup -g 1000 -S mc  &&\
adduser -u 1000 -S -D -G mc mc && \
chmod +x /start.sh &&\
mkdir -p /data &&\
chown mc:mc /data

USER mc


EXPOSE 25565
EXPOSE 25566

ENTRYPOINT ["sh","/start.sh"]
