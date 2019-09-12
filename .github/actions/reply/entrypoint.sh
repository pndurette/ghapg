#!/bin/sh

set -e
set -o pipefail

# GitHub API Headers
HEADER_ACCEPT="Accept: application/vnd.github.v3+json"
HEADER_AUTHZ="Authorization: token ${GITHUB_TOKEN}"
HEADER_CONTENT="Content-Type: application/json"

_request() {
    # Add comment to issue
    # https://developer.github.com/v3/issues/comments/#create-a-comment
    # Payload: {"body": "<message>"}
    # Request: POST /repos/:owner/:repo/issues/:issue_number/comments

    MESSAGE_RAW="Hi \@$(_user), you said:\n\n> $(_comment)"
    MESSAGE_JSON=$(jq --compact-output --null-input \
        --arg body "$MESSAGE_RAW" \
        '{body: $body}')
    
    curl -sSL \
        -H "${HEADER_ACCEPT}" \
        -H "${HEADER_AUTHZ}" \
        -H "${HEADER_CONTENT}" \
        -d \'${MESSAGE_JSON}\' \
        -X POST "$(_issue_comments_url)"
}

_jq() {
    # All 'jq' queries done on this payload type:
    # https://developer.github.com/v3/activity/events/types/#issuecommentevent

    QUERY=$1
    jq --raw-output "${QUERY}" "$GITHUB_EVENT_PATH"
}

_comment() {
    # Get the comment body (contents)
    _jq ".comment | .body"
}

_user() {
    # Get the comment author username
    _jq ".comment | .user | .login"
}

_issue_comments_url() {
    # Get the issues comments URL API endpoint
    _jq ".issue | .comments_url"
}

main() {
   _request
}

main