#!/bin/bash

# shellcheck disable=SC1091

set -o errexit
set -o nounset
set -o pipefail
# set -o xtrace # Uncomment this line for debugging purpose

# Load DokuWiki environment
. /opt/bitnami/scripts/dokuwiki-env.sh

# Load environment for web server configuration (after DokuWiki environment file so MODULE is not set to a wrong value)
. /opt/bitnami/scripts/libwebserver.sh

# Load libraries
. /opt/bitnami/scripts/libdokuwiki.sh

# Ensure DokuWiki environment variables are valid
dokuwiki_validate

# Update web server configuration with runtime environment (needs to happen before the initialization)
web_server_update_app_configuration "dokuwiki"

# Ensure DokuWiki is initialized
dokuwiki_initialize
