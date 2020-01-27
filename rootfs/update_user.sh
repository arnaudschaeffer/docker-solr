#!/bin/bash

set -x

# Adapt UID & GID if needed
if [[ -n "$UID" ]] && [[ "$(id -u solr)" != "$UID" ]]; then
    usermod -u ${UID} solr
fi

if [[ -n "$GID" ]] && [[ "$(id -g solr)" != "$GID" ]]; then
    groupmod -g ${GID} solr
fi