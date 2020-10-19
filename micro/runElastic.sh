docker run -d -it --net=micro_mynetwork --name es -p 9200:9200 -e "discovery.type=single-node" docker.elastic.co/elasticsearch/elasticsearch:6.5.1 && \
docker run -d -it --net=micro_mynetwork --name kibanak --link es:elasticsearch -p 5601:5601 docker.elastic.co/kibana/kibana:6.5.2 && \
docker run -d -it --net=micro_mynetwork --name logm -p 5000:5000 -vvv -e xpack.monitoring.enabled=true -e xpack.monitoring.elasticsearch.hosts=127.0.0.1:9200 docker.elastic.co/logstash/logstash:6.5.2 && \
docker run -d -it --net=micro_mynetwork --name filebeatms -p 12201:12201 -v /tmp:/usr/share/filebeat/logs/ docker.elastic.co/beats/filebeat:6.5.4
