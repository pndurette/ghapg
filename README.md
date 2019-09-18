# ghapg
> ghapg: [GitHub Actions](https://github.com/features/actions) Playground. Repo of GitHub Actions experiments and PoCs.



## Actions

### [`reply-docker`](reply-docker/) & [`reply-nodejs`](reply-nodejs/)

Reply to an issue comment.

Both do the exact same thing and are used the exact same way. `reply-docker` uses Bash inside a Docker container (using the [GitHub REST API](https://developer.github.com/v3/issues/comments/#create-a-comment)), `reply-nodejs` runs Node (using the [GitHub Actions Toolkit](https://github.com/actions/toolkit)).

This exercise shows how to obtain the GitHub event payload in each case, as well as using the [GitHub App token](https://help.github.com/en/articles/virtual-environments-for-github-actions#github_token-secret) to make an authenticated GitHub API call (i.e. posting an issue comment).

See [.github/workflows/pong.yml](.github/workflows/pong.yml) for example usage (and write an issue comment in this repo to get a response from both!)