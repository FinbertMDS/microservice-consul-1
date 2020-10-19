# pull docker
docker pull docker.elastic.co/elasticsearch/elasticsearch:6.5.4 && \
docker pull docker.elastic.co/kibana/kibana:6.5.4 && \
docker pull docker.elastic.co/logstash/logstash:6.5.4 && \
docker pull docker.elastic.co/beats/filebeat:6.5.4

# run docker
docker run -d -it --net=micro_mynetwork --name es -p 9200:9200 -e "discovery.type=single-node" docker.elastic.co/elasticsearch/elasticsearch:6.5.4 && \
docker run -d -it --net=micro_mynetwork --name kibanak --link es:elasticsearch -p 5601:5601 docker.elastic.co/kibana/kibana:6.5.4 && \
docker run -d -it --net=micro_mynetwork --name logm -p 5000:5000 -vvv -e xpack.monitoring.enabled=true -e xpack.monitoring.elasticsearch.hosts=elasticsearch:9200 docker.elastic.co/logstash/logstash:6.5.4 && \
docker run -d -it --net=micro_mynetwork --name filebeatms -p 12201:12201 docker.elastic.co/beats/filebeat:6.5.4