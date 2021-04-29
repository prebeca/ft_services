FROM alpine:3.13

COPY ./srcs/ /srcs/

RUN apk add --no-cache\
	influxdb \
	telegraf \
	supervisor

RUN mkdir /etc/telegraf/ ;\
	mv /srcs/telegraf.conf /etc/telegraf/telegraf.conf

EXPOSE 8086

CMD ["sh", "srcs/start.sh"]
