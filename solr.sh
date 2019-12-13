#!/bin/bash

# Adapt UID & GID if needed
if [[ -n "$UID" ]] && [[ "$(id -u solr)" != "$UID" ]]; then
    usermod -u ${UID} solr
fi

if [[ -n "$GID" ]] && [[ "$(id -g solr)" != "$GID" ]]; then
    groupmod -g ${GID} solr
fi

ADDITIONAL_OPTS=""
# Be sure permissions are OK
chown -R solr:solr /opt/solr
chown -R solr:solr /var/solr

if [ -n "$SOLR_DATA_DIR" ] ; then
    chown -R solr:solr $SOLR_DATA_DIR
    ADDITIONAL_OPTS="$ADDITIONAL_OPTS -Dsolr.data.dir=$SOLR_DATA_DIR"
fi

if [ -n "$ADDITIONAL_OPTS" ]; then
    ADDITIONAL_OPTS="$ADDITIONAL_OPTS"
fi

if [ -n "$SOLR_HOME" ]; then
    chown -R solr:solr $SOLR_HOME
fi

exec su -c "/opt/solr/bin/solr $* $ADDITIONAL_OPTS" solr
