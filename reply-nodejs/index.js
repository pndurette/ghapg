const core = require('@actions/core');
const github = require('@actions/github');

async function run() {
    // https://github.com/actions/toolkit/tree/master/packages/github
    const client = new github.GitHub(
        // https://github.com/actions/toolkit/tree/master/packages/core
        core.getInput('repo-token', {required: true})
    )

    // Build response body
    const context = github.context
    const comment = context.payload.comment.body
    const user    = context.payload.comment.user.login
    const body = `Hi @${user}, you said:

> ${comment}

_(by \`reply-nodejs\`)_`

    // Param object for octokit.issues.createComment()
    const comment_payload = {
        owner: context.payload.repository.owner.login,
        repo:  context.payload.repository.name,
        issue_number: context.payload.issue.number,
        body: body
    }

    console.log('comment:', comment_payload)

    // https://octokit.github.io/rest.js/#octokit-routes-issues-create-comment
    const newIssue = await client.issues.createComment(comment_payload)
}

run();