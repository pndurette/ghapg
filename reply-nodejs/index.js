const core = require('@actions/core');
const github = require('@actions/github');

async function run() {
    const client = new github.GitHub(
        core.getInput('repo-token', {required: true})
    )

    const context = github.context

    const comment = context.payload.comment.body
    const user    = context.payload.comment.user.login

    const body = `Hi @${user}, you said:

> ${comment}`

    const comment_payload = {
        owner: context.payload.repository.owner.login,
        repo:  context.payload.repository.name,
        issue_number: context.payload.issue.number,
        body: body
    }

    console.log(comment_payload)

    const newIssue = await client.issues.createComment(comment_payload)
}

run();