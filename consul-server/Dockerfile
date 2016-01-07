FROM gliderlabs/consul-server:0.6

ADD ./config/start.sh /opt/bin/consul-start.sh
RUN chmod u=rwx /opt/bin/consul-start.sh

ENTRYPOINT ["/opt/bin/consul-start.sh", "-server", "-config-dir=/config"]

