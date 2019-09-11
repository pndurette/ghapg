# Container image that runs your code
FROM alpine:3.10

# GitHub Actions metadata
LABEL "com.github.actions.name"="reply"
LABEL "com.github.actions.description"="Replies"
LABEL "com.github.actions.icon"="speaker"
LABEL "com.github.actions.color"="purple"

# RUN apk add --no-cache \
#     jq \
#     curl \
#     git

RUN apk add --no-cache jq


# Copies your code file from your action repository to the filesystem path `/` of the container
COPY entrypoint.sh /entrypoint.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]