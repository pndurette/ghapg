const core = require('@actions/core');
const github = require('@actions/github');

const client = new github.GitHub(
    core.getInput('repo-token', {required: true})
)

const context = github.context

// console.log(context)

const comment = context.payload.comment.body
const user = context.payload.comment.user

console.log(comment)
console.log(user)