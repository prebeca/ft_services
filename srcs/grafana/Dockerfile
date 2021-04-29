FROM alpine:3.13

COPY ./srcs/ /srcs/

RUN apk add --no-cache\
	grafana \
	telegraf \
	supervisor

RUN mv /srcs/datasource.yaml /usr/share/grafana/conf/provisioning/datasources/ ;\
	mv /srcs/dashboards.yaml /usr/share/grafana/conf/provisioning/dashboards/

RUN mkdir /etc/telegraf/ ;\
	mv /srcs/telegraf.conf /etc/telegraf/telegraf.conf

EXPOSE 3000

CMD ["sh", "srcs/start.sh"]