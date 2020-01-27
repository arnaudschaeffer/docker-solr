From solr:8.0

# Override entry point
USER root

COPY rootfs /
RUN chmod +x /*.sh

CMD ["/docker-entrypoint.sh", "-f"]
