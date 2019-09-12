const core = require('@actions/core');
const github = require('@actions/github');

const client = new github.GitHub(
    core.getInput('repo-token', {required: true})
)

const context = github.context

console.log(context)