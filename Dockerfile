From solr:8.0

# Override entry point
USER root
COPY solr.sh /solr.sh

CMD ["/solr.sh", "-f"]
