const core = require('@actions/core');
const github = require('@actions/github');

const client = new github.GitHub(
    core.getInput('repo-token', {required: true})
)

const context = github.context

const comment = context.payload.comment.body
const user    = context.payload.comment.user.login

console.log(comment)
console.log(user)

const newIssue = client.issues.createComment({
    owner = context.payload.repository.owner.login,
    repo = 'pndurette',
    issue_number = 6,
    body = 'POWER'
})