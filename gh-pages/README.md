# GH-Page

The purpose of this GitHub action is to copy a directory to GitHub pages. This is a fork of [https://github.com/maxheld83/ghpages](https://github.com/maxheld83/ghpages). We would use the original but it requires a `Personal Access Token`, which means that if somebody slipped a malicious docker image in, they could copy out our credentials. As a result we need to keep our own version :(.



| NAME      | PURPOSE                           |
| --------- | --------------------------------- |
| BUILD_DIR | The directory to push up          |
| GH_PAT    | Your GitHub Personal Access Token |


Use the GitHub action in the following way:

```
workflow "Deploy" {
  on = "push"
  resolves = ["Deploy to GitHub Pages"]
}

action "Filter master" {
  uses = "actions/bin/filter@46ffca7632504e61db2d4cb16be1e80f333cb859"
  args = "branch master"
}

action "Deploy to GitHub Pages" {
  uses = "docker://cdssnc/gh-pages-github-action"
  env = {
    BUILD_DIR = "public/"
  }
  secrets = ["GH_PAT"]
}

```