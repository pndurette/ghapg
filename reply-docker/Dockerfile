# Container image that runs your code
FROM alpine:3.10

# GitHub Actions metadata
# Only used when a published Docker image is the Action itself
# Icons: https://help.github.com/en/articles/metadata-syntax-for-github-actions#icon
# Colors: https://help.github.com/en/articles/metadata-syntax-for-github-actions#color
LABEL "com.github.actions.name"="reply"
LABEL "com.github.actions.description"="Replies back to an issue comment"
LABEL "com.github.actions.icon"="edit-3"
LABEL "com.github.actions.color"="purple"

# Utils
RUN apk add --no-cache \
    jq \
    curl

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY entrypoint.sh /entrypoint.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]