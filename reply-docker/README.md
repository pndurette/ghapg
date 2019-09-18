# `pndurette/ghapg/reply-docker`

This simple action responds to an issue comment, quoting it and mentioning its author.

## Events

### `issue_comment` 

Tested with `types`: `created`

## Inputs

### `repo-token`

**Required** Token for the repo. Set literallty to `${{ secrets.GITHUB_TOKEN }}`. No default.

## Outputs

None

## Example usage

```yaml
uses: pndurette/ghapg/reply-docker@master
with:
  repo-token: ${{ secrets.GITHUB_TOKEN }}
```