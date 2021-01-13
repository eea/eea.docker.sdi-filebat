FROM docker.elastic.co/beats/filebeat:7.9.3

USER root
RUN yum install -y wget

RUN rm filebeat.yml && \
    wget https://raw.githubusercontent.com/geonetwork/docker-geonetwork/4.0.2/4.0.2/filebeat/filebeat.yml && \
    wget https://raw.githubusercontent.com/geonetwork/docker-geonetwork/4.0.2/4.0.2/filebeat/templates/Filebeat-apache.json && \
    wget https://raw.githubusercontent.com/geonetwork/docker-geonetwork/4.0.2/4.0.2/filebeat/modules.d/apache.yml.disabled

RUN mv Filebeat-apache.json /usr/share/filebeat/templates && \
    mv apache.yml.disabled /usr/share/filebeat/modules.d/apache.yml
ADD entrypoint.sh /
RUN chown root:filebeat /entrypoint.sh

RUN chown -R filebeat:filebeat /usr/share/filebeat
ENTRYPOINT /entrypoint.sh
USER filebeat

