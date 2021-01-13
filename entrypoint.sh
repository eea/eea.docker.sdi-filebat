#!/bin/bash

sed "s#geonetwork#catalogue#g" -i /usr/share/filebeat/filebeat.yml

#chown -R root:filebeat /usr/share/filebeat
sed "s#username: admin#username: $GEONETWORK_USERNAME#g" -i /usr/share/filebeat/filebeat.yml
sed "s#password: admin#password: $GEONETWORK_PASSWORD#g" -i /usr/share/filebeat/filebeat.yml
sed "s#host: \"www:80\"#host: $KIBANA_HOST#g" -i /usr/share/filebeat/filebeat.yml

filebeat -e -strict.perms=false
