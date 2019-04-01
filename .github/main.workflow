workflow "Lint dockerfiles" {
  on = "push"
  resolves = ["Lint docker files"]
}

action "Lint docker files" {
  uses = "docker://cdssnc/docker-lint"
}

workflow "Backup to S3" {
  on = "push"
  resolves = ["Uploads your workspace to S3", "Branch is master"]
}

action "Branch is master" {
  uses = "actions/bin/filter@d820d56839906464fb7a57d1b4e1741cf5183efa"
  args = "branch master"
}

action "Uploads your workspace to S3" {
  uses = "./diefenbunker"
  needs = ["Branch is master"]
  secrets = ["AWS_KEY", "AWS_SECRET"]
  env = {
    S3_DESTINATION = "s3://cds-github/diefenbunker/"
  }
}

workflow "Docker build" {
  on = "push"
  resolves = [
    "Push touched",
    "Push auto-commit",
  ]
}

action "Is master" {
  uses = "actions/bin/filter@3c98a2679187369a2116d4f311568596d3725740"
  args = "branch master"
}

action "Touched Action" {
  uses = "docker://cdssnc/touched-github-action:latest"
  needs = ["Docker Registry"]
  args = "touched/**"
}

action "Docker Registry" {
  uses = "actions/docker/login@8cdf801b322af5f369e00d85e9cf3a7122f49108"
  needs = ["Is master"]
  secrets = ["DOCKER_USERNAME", "DOCKER_PASSWORD"]
}

action "Build touched" {
  uses = "actions/docker/cli@8cdf801b322af5f369e00d85e9cf3a7122f49108"
  needs = ["Touched Action"]
  args = "build -t cdssnc/touched-github-action ./touched"
}

action "Push touched" {
  uses = "actions/docker/cli@8cdf801b322af5f369e00d85e9cf3a7122f49108"
  needs = ["Build touched"]
  args = "push cdssnc/touched-github-action"
}

action "Auto-commit Action" {
  uses = "docker://cdssnc/touched-github-action"
  needs = ["Docker Registry"]
  args = "auto-commit/**"
}

action "Build auto-commit" {
  uses = "actions/docker/cli@8cdf801b322af5f369e00d85e9cf3a7122f49108"
  needs = ["Auto-commit Action"]
  args = "build -t cdssnc/auto-commit-github-action ./auto-commit"
}

action "Push auto-commit" {
  uses = "actions/docker/cli@8cdf801b322af5f369e00d85e9cf3a7122f49108"
  needs = ["Build auto-commit"]
  args = "push cdssnc/auto-commit-github-action"
}
