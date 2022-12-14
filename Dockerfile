FROM alpine:latest
RUN  apk update \
  && apk upgrade \
  && apk add ca-certificates \
  && update-ca-certificates \
  && apk add --update coreutils && rm -rf /var/cache/apk/*   \
  && apk add --update openjdk17 tzdata curl unzip bash \
  && apk add --no-cache nss \
  && rm -rf /var/cache/apk/* \

RUN apk add bc
RUN apk add tcptraceroute
COPY tcpping /usr/bin/
RUN chmod 755 /usr/bin/tcpping
RUN apk add --no-cache tzdata
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN mkdir -p /data
