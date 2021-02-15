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

# Install additional plugins for Nextcloud's fulltext search
RUN \
    bin/elasticsearch-plugin install --batch ingest-attachment
