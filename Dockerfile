#
# Created Date: Monday, February 15th 2021, 12:37:40 pm
# Author: MiGoller
# 
# Copyright (c) 2021 MiGoller
#

# Set the base elastic image's tag
ARG ELASTICTAG=7.9.3

# Set the base image to use for subsequent instructions.
FROM elasticsearch:${ELASTICTAG}

ARG ELASTICSEARCHPLUGINS="ingest-attachment"

# Basic build-time metadata as defined at http://label-schema.org
LABEL \
    org.label-schema.docker.dockerfile="/Dockerfile" \
    org.label-schema.license="MIT" \
    org.label-schema.name="MiGoller" \
    org.label-schema.vendor="MiGoller" \
    org.label-schema.version="${ELASTICTAG}" \
    org.label-schema.description="Elasticsearch for Docker and Nextcloud" \
    org.label-schema.url="https://github.com/MiGoller/elasticsearch-docker" \
    org.label-schema.vcs-type="Git" \
    # org.label-schema.vcs-ref="${ARG_APP_COMMIT}" \
    org.label-schema.vcs-url="https://github.com/MiGoller/elasticsearch-docker.git" \
    maintainer="MiGoller" \
    Author="MiGoller" \
    org.opencontainers.image.source="https://github.com/MiGoller/elasticsearch-docker"

# Install additional plugins for Nextcloud's fulltext search
RUN \
    bin/elasticsearch-plugin install --batch ${ELASTICSEARCHPLUGINS}
