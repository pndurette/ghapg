const core = require('@actions/core');
const github = require('@actions/github');

async function run() {
    const client = new github.GitHub(
        core.getInput('repo-token', {required: true})
    )

    const context = github.context

    const comment = context.payload.comment.body
    const user    = context.payload.comment.user.login

    console.log(comment)
    console.log(user)

    const comment_payload = {
        owner: context.payload.repository.owner.login,
        repo: 'ghapg',
        issue_number: 6,
        body: 'POWER'
    }

    console.log(comment_payload)

    const newIssue = await client.issues.createComment(comment_payload)
}

run();