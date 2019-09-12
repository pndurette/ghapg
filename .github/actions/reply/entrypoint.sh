#!/bin/sh

set -e
set -o pipefail

# GitHub API Headers
# ${GITHUB_TOKEN} must be passed explicitly
# https://help.github.com/en/articles/virtual-environments-for-github-actions#github_token-secret
HEADER_ACCEPT="Accept: application/vnd.github.v3+json"
HEADER_AUTHZ="Authorization: token ${GITHUB_TOKEN}"
HEADER_CONTENT="Content-Type: application/json"

_request() {
    # Add comment to the issue
    # https://developer.github.com/v3/issues/comments/#create-a-comment
    # Payload: {"body": "<message>"}
    # Request: POST /repos/:owner/:repo/issues/:issue_number/comments
    
#     MESSAGE_RAW=$(cat <<-EOF
# Hi @$(_user), you said:

# > $(_comment)
# EOF
# )

    MESSAGE_RAW="Hi @$(_user), you said:\n"
    while read line; do
        echo "test"
        # MESSAGE_RAW="${MESSAGE_RAW}\n>$line"
    done <<< "$(_comment)"

    jq --compact-output --null-input \
        --arg body "$MESSAGE_RAW" \
        '{body: $body}' | curl -vvv -sSL \
            -H "${HEADER_ACCEPT}" \
            -H "${HEADER_AUTHZ}" \
            -H "${HEADER_CONTENT}" \
            -d @- \
            -X POST "$(_issue_comments_url)"
}

_jq() {
    QUERY=$1
    # All 'jq' queries done on this payload type:
    # https://developer.github.com/v3/activity/events/types/#issuecommentevent
    # GitHub Actions saves the event payload JSON at $GITHUB_EVENT_PATH
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
    # Get the issue's comments URL API endpoint
    _jq ".issue | .comments_url"
}

_request