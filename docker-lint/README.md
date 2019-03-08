# Docker lint GitHub Action

The purpose of this GitHub action is to lint your Docker files. It uses [hadolint](https://github.com/hadolint/hadolint) to lint all files in your `Dockerfiles` which are based on [Docker best practices](https://docs.docker.com/develop/develop-images/dockerfile_best-practices/). It allows you to pass the specific `hadolint` overrides in the `args` field:

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

The resulting output will look something like this when it fails:

```
Searching for Dockerfiles ...
-----------------------------
Processing /github/workspace/auto-commit/Dockerfile
Processing /github/workspace/touched/Dockerfile
Processing /github/workspace/google-analytics-anonymize-ip/Dockerfile

Found the following issues
--------------------------
/github/workspace/google-analytics-anonymize-ip/Dockerfile:13 DL3020 Use COPY instead of ADD for files and folders

### FAILED Lint docker files #2 15:26:20Z (10.533s)
```
