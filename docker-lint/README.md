# Docker lint GitHub Action

The purpose of this GitHub action is to lint your docker files. It uses [https://github.com/hadolint/hadolint](https://github.com/hadolint/hadolint) to lint all files in your `Dockerfiles` which are based on [Docker best practices](https://docs.docker.com/engine/userguide/eng-image/dockerfile_best-practices). It allows you to pass the specific `hadolint` overrides in the `args` field:

```
--ignore DL3007 --trusted-registry my-company.com:500
```

Use the GitHub action in the following way:

```
workflow "Lint all Dockerfiles" {
  on = "push"
  resolves = ["Linter"]
}

action "Linter" {
  uses = "docker://cdssnc/docker-lint"
  args = "--ignore DL3007"
}

```
