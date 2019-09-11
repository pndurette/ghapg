#!/bin/bash

set -e
set -o pipefail

main() {
   echo jq --raw-output . "$GITHUB_EVENT_PATH"
}

main