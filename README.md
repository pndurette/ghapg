# ghapg
> ghapg: [GitHub Actions](https://github.com/features/actions) Playground. Repo of GitHub Actions experiments and PoCs.



## [`reply-nodejs`](reply-nodejs/) & [`reply-docker`](reply-docker/)

Both do the exact same thing and are used the exact same way, but built differently:

* `reply-nodejs` runs node.js (using the [GitHub Actions Toolkit](https://github.com/actions/toolkit)).

* `reply-docker` runs Bash inside a Docker container (using `jq` & `curl`)

This exercise shows how to obtain the GitHub event payload in each case, as well as using the [GitHub App token](https://help.github.com/en/articles/virtual-environments-for-github-actions#github_token-secret) to make an authenticated GitHub API call (i.e. posting an issue comment).

### Usage

This demonstrates the 3 (*AFAIK*) [ways to run a GitHub Action](https://help.github.com/en/articles/workflow-syntax-for-github-actions#jobsjob_idstepsuses):

* `reply-nodejs`, node.js **[1]**
* `reply-docker`, Docker image:
  * from GitHub **[2]**
  * from a published image **[3]**

**[1]** and **[2]** are actual GitHub Actions, with an `action.yml` [metadata file](https://help.github.com/en/articles/metadata-syntax-for-github-actions).

See [.github/workflows/pong.yml](.github/workflows/pong.yml), [`reply-nodejs`](reply-nodejs/) and [`reply-docker`](reply-docker/) for usage.

Write an issue comment in this repo to get a response from all 3!

#### Note about published Docker images

**[3]** while not being an Action per se, is the exact same as [2] but instead of using an `action.yml` (and building a `Dockerfile`), GitHub pulls an image previously pushed to a container registry ([e.g.](https://hub.docker.com/r/pndurette/reply-docker)). Any passing of arguments and environments done in [2]'s `action.yml` must be done explicitly in the Workflow file (using [`args`](https://help.github.com/en/articles/workflow-syntax-for-github-actions#jobsjob_idstepswithargs),  [`env`](https://help.github.com/en/articles/workflow-syntax-for-github-actions#jobsjob_idstepsenv), etc.). e.g.:

```
pong-docker-hub:
	runs-on: ubuntu-latest
	steps:
	- uses: docker://pndurette/reply-docker:latest
		env:
			GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
```