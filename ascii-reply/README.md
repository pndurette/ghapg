# `pndurette/ghapg/ascii-reply`

This simple action responds to an issue comment, with the comment in ASCII art text.

Can be restricted to a 'command' (e.g. `/ascii <text>`).

## Events

### `issue_comment` 

Tested with `types`: `created`

## Inputs

### `repo-token`

**Required** Token for the repo. Set literally to `${{ secrets.GITHUB_TOKEN }}`. No default.

## Outputs

None

## Example usage

```yaml
uses: pndurette/ghapg/ascii-reply@v1
if: startsWith(github.event.comment.body, '/ascii')
with:
  repo-token: ${{ secrets.GITHUB_TOKEN }}
```
