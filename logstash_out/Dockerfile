FROM logstash:2

RUN logstash-plugin install logstash-input-rabbitmq logstash-output-mongodb

COPY logstash.conf /etc/logstash/

CMD ["-f", "/etc/logstash/logstash.conf","--debug"]
