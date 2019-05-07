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

workflow "touched docker build" {
  on = "push"
  resolves = [
    "push touched"
  ]
}

action "touched is master" {
  uses = "actions/bin/filter@3c98a2679187369a2116d4f311568596d3725740"
  args = "branch master"
}

action "touched docker registry" {
  uses = "actions/docker/login@8cdf801b322af5f369e00d85e9cf3a7122f49108"
  needs = ["touched is master"]
  secrets = ["DOCKER_USERNAME", "DOCKER_PASSWORD"]
}

action "touched action" {
  uses = "docker://cdssnc/touched-github-action:latest"
  needs = ["touched docker registry"]
  args = "touched/**"
}

action "build touched" {
  uses = "actions/docker/cli@8cdf801b322af5f369e00d85e9cf3a7122f49108"
  needs = ["touched action"]
  args = "build -t cdssnc/touched-github-action ./touched"
}

action "push touched" {
  uses = "actions/docker/cli@8cdf801b322af5f369e00d85e9cf3a7122f49108"
  needs = ["build touched"]
  args = "push cdssnc/touched-github-action"
}

workflow "auto-commit docker build" {
  on = "push"
  resolves = [
    "push auto-commit"
  ]
}

action "auto-commit is master" {
  uses = "actions/bin/filter@3c98a2679187369a2116d4f311568596d3725740"
  args = "branch master"
}

action "auto-commit docker registry" {
  uses = "actions/docker/login@8cdf801b322af5f369e00d85e9cf3a7122f49108"
  needs = ["auto-commit is master"]
  secrets = ["DOCKER_USERNAME", "DOCKER_PASSWORD"]
}

action "auto-commit action" {
  uses = "docker://cdssnc/touched-github-action:latest"
  needs = ["auto-commit docker registry"]
  args = "auto-commit/**"
}

action "build auto-commit" {
  uses = "actions/docker/cli@8cdf801b322af5f369e00d85e9cf3a7122f49108"
  needs = ["auto-commit action"]
  args = "build -t cdssnc/auto-commit-github-action ./auto-commit"
}

action "push auto-commit" {
  uses = "actions/docker/cli@8cdf801b322af5f369e00d85e9cf3a7122f49108"
  needs = ["build auto-commit"]
  args = "push cdssnc/auto-commit-github-action"
}

workflow "diefenbunker docker build" {
  on = "push"
  resolves = [
    "push diefenbunker"
  ]
}

action "diefenbunker is master" {
  uses = "actions/bin/filter@3c98a2679187369a2116d4f311568596d3725740"
  args = "branch master"
}

action "diefenbunker docker registry" {
  uses = "actions/docker/login@8cdf801b322af5f369e00d85e9cf3a7122f49108"
  needs = ["diefenbunker is master"]
  secrets = ["DOCKER_USERNAME", "DOCKER_PASSWORD"]
}

action "diefenbunker action" {
  uses = "docker://cdssnc/touched-github-action:latest"
  needs = ["diefenbunker docker registry"]
  args = "diefenbunker/**"
}

action "build diefenbunker" {
  uses = "actions/docker/cli@8cdf801b322af5f369e00d85e9cf3a7122f49108"
  needs = ["diefenbunker action"]
  args = "build -t cdssnc/diefenbunker-github-action ./diefenbunker"
}

action "push diefenbunker" {
  uses = "actions/docker/cli@8cdf801b322af5f369e00d85e9cf3a7122f49108"
  needs = ["build diefenbunker"]
  args = "push cdssnc/diefenbunker-github-action"
}

workflow "docker-lint docker build" {
  on = "push"
  resolves = [
    "push docker-lint"
  ]
}

action "docker-lint is master" {
  uses = "actions/bin/filter@3c98a2679187369a2116d4f311568596d3725740"
  args = "branch master"
}

action "docker-lint docker registry" {
  uses = "actions/docker/login@8cdf801b322af5f369e00d85e9cf3a7122f49108"
  needs = ["docker-lint is master"]
  secrets = ["DOCKER_USERNAME", "DOCKER_PASSWORD"]
}

action "docker-lint action" {
  uses = "docker://cdssnc/touched-github-action:latest"
  needs = ["docker-lint docker registry"]
  args = "docker-lint/**"
}

action "build docker-lint" {
  uses = "actions/docker/cli@8cdf801b322af5f369e00d85e9cf3a7122f49108"
  needs = ["docker-lint action"]
  args = "build -t cdssnc/docker-lint-github-action ./docker-lint"
}

action "push docker-lint" {
  uses = "actions/docker/cli@8cdf801b322af5f369e00d85e9cf3a7122f49108"
  needs = ["build docker-lint"]
  args = "push cdssnc/docker-lint-github-action"
}

workflow "elmo-fire docker build" {
  on = "push"
  resolves = [
    "push elmo-fire"
  ]
}

action "elmo-fire is master" {
  uses = "actions/bin/filter@3c98a2679187369a2116d4f311568596d3725740"
  args = "branch master"
}

action "elmo-fire docker registry" {
  uses = "actions/docker/login@8cdf801b322af5f369e00d85e9cf3a7122f49108"
  needs = ["elmo-fire is master"]
  secrets = ["DOCKER_USERNAME", "DOCKER_PASSWORD"]
}

action "elmo-fire action" {
  uses = "docker://cdssnc/touched-github-action:latest"
  needs = ["elmo-fire docker registry"]
  args = "elmo-fire/**"
}

action "build elmo-fire" {
  uses = "actions/docker/cli@8cdf801b322af5f369e00d85e9cf3a7122f49108"
  needs = ["elmo-fire action"]
  args = "build -t cdssnc/elmo-fire-github-action ./elmo-fire"
}

action "push elmo-fire" {
  uses = "actions/docker/cli@8cdf801b322af5f369e00d85e9cf3a7122f49108"
  needs = ["build elmo-fire"]
  args = "push cdssnc/elmo-fire-github-action"
}

workflow "google-analytics-anonymize-ip docker build" {
  on = "push"
  resolves = [
    "push google-analytics-anonymize-ip"
  ]
}

action "google-analytics-anonymize-ip is master" {
  uses = "actions/bin/filter@3c98a2679187369a2116d4f311568596d3725740"
  args = "branch master"
}

action "google-analytics-anonymize-ip docker registry" {
  uses = "actions/docker/login@8cdf801b322af5f369e00d85e9cf3a7122f49108"
  needs = ["google-analytics-anonymize-ip is master"]
  secrets = ["DOCKER_USERNAME", "DOCKER_PASSWORD"]
}

action "google-analytics-anonymize-ip action" {
  uses = "docker://cdssnc/touched-github-action:latest"
  needs = ["google-analytics-anonymize-ip docker registry"]
  args = "google-analytics-anonymize-ip/**"
}

action "build google-analytics-anonymize-ip" {
  uses = "actions/docker/cli@8cdf801b322af5f369e00d85e9cf3a7122f49108"
  needs = ["google-analytics-anonymize-ip action"]
  args = "build -t cdssnc/google-analytics-anonymize-ip-github-action ./google-analytics-anonymize-ip"
}

action "push google-analytics-anonymize-ip" {
  uses = "actions/docker/cli@8cdf801b322af5f369e00d85e9cf3a7122f49108"
  needs = ["build google-analytics-anonymize-ip"]
  args = "push cdssnc/google-analytics-anonymize-ip-github-action"
}

workflow "lighthouse-score docker build" {
  on = "push"
  resolves = [
    "push lighthouse-score"
  ]
}

action "lighthouse-score is master" {
  uses = "actions/bin/filter@3c98a2679187369a2116d4f311568596d3725740"
  args = "branch master"
}

action "lighthouse-score docker registry" {
  uses = "actions/docker/login@8cdf801b322af5f369e00d85e9cf3a7122f49108"
  needs = ["lighthouse-score is master"]
  secrets = ["DOCKER_USERNAME", "DOCKER_PASSWORD"]
}

action "lighthouse-score action" {
  uses = "docker://cdssnc/touched-github-action:latest"
  needs = ["lighthouse-score docker registry"]
  args = "lighthouse-score/**"
}

action "build lighthouse-score" {
  uses = "actions/docker/cli@8cdf801b322af5f369e00d85e9cf3a7122f49108"
  needs = ["lighthouse-score action"]
  args = "build -t cdssnc/lighthouse-score-github-action ./lighthouse-score"
}

action "push lighthouse-score" {
  uses = "actions/docker/cli@8cdf801b322af5f369e00d85e9cf3a7122f49108"
  needs = ["build lighthouse-score"]
  args = "push cdssnc/lighthouse-score-github-action"
}

workflow "node-license-checker docker build" {
  on = "push"
  resolves = [
    "push node-license-checker"
  ]
}

action "node-license-checker is master" {
  uses = "actions/bin/filter@3c98a2679187369a2116d4f311568596d3725740"
  args = "branch master"
}

action "node-license-checker docker registry" {
  uses = "actions/docker/login@8cdf801b322af5f369e00d85e9cf3a7122f49108"
  needs = ["node-license-checker is master"]
  secrets = ["DOCKER_USERNAME", "DOCKER_PASSWORD"]
}

action "node-license-checker action" {
  uses = "docker://cdssnc/touched-github-action:latest"
  needs = ["node-license-checker docker registry"]
  args = "node-license-checker/**"
}

action "build node-license-checker" {
  uses = "actions/docker/cli@8cdf801b322af5f369e00d85e9cf3a7122f49108"
  needs = ["node-license-checker action"]
  args = "build -t cdssnc/node-license-checker-github-action ./node-license-checker"
}

action "push node-license-checker" {
  uses = "actions/docker/cli@8cdf801b322af5f369e00d85e9cf3a7122f49108"
  needs = ["build node-license-checker"]
  args = "push cdssnc/node-license-checker-github-action"
}

workflow "seekret docker build" {
  on = "push"
  resolves = [
    "push seekret"
  ]
}

action "seekret is master" {
  uses = "actions/bin/filter@3c98a2679187369a2116d4f311568596d3725740"
  args = "branch master"
}

action "seekret docker registry" {
  uses = "actions/docker/login@8cdf801b322af5f369e00d85e9cf3a7122f49108"
  needs = ["seekret is master"]
  secrets = ["DOCKER_USERNAME", "DOCKER_PASSWORD"]
}

action "seekret action" {
  uses = "docker://cdssnc/touched-github-action:latest"
  needs = ["seekret docker registry"]
  args = "seekret/**"
}

action "build seekret" {
  uses = "actions/docker/cli@8cdf801b322af5f369e00d85e9cf3a7122f49108"
  needs = ["seekret action"]
  args = "build -t cdssnc/seekret-github-action ./seekret"
}

action "push seekret" {
  uses = "actions/docker/cli@8cdf801b322af5f369e00d85e9cf3a7122f49108"
  needs = ["build seekret"]
  args = "push cdssnc/seekret-github-action"
}

workflow "tf-lint docker build" {
  on = "push"
  resolves = [
    "push tf-lint"
  ]
}

action "tf-lint is master" {
  uses = "actions/bin/filter@3c98a2679187369a2116d4f311568596d3725740"
  args = "branch master"
}

action "tf-lint docker registry" {
  uses = "actions/docker/login@8cdf801b322af5f369e00d85e9cf3a7122f49108"
  needs = ["tf-lint is master"]
  secrets = ["DOCKER_USERNAME", "DOCKER_PASSWORD"]
}

action "tf-lint action" {
  uses = "docker://cdssnc/touched-github-action:latest"
  needs = ["tf-lint docker registry"]
  args = "tf-lint/**"
}

action "build tf-lint" {
  uses = "actions/docker/cli@8cdf801b322af5f369e00d85e9cf3a7122f49108"
  needs = ["tf-lint action"]
  args = "build -t cdssnc/tf-lint-github-action ./tf-lint"
}

action "push tf-lint" {
  uses = "actions/docker/cli@8cdf801b322af5f369e00d85e9cf3a7122f49108"
  needs = ["build tf-lint"]
  args = "push cdssnc/tf-lint-github-action"
}

workflow "gh-pages docker build" {
  on = "push"
  resolves = [
    "push gh-pages"
  ]
}

action "gh-pages is master" {
  uses = "actions/bin/filter@3c98a2679187369a2116d4f311568596d3725740"
  args = "branch master"
}

action "gh-pages docker registry" {
  uses = "actions/docker/login@8cdf801b322af5f369e00d85e9cf3a7122f49108"
  needs = ["gh-pages is master"]
  secrets = ["DOCKER_USERNAME", "DOCKER_PASSWORD"]
}

action "gh-pages action" {
  uses = "docker://cdssnc/touched-github-action:latest"
  needs = ["gh-pages docker registry"]
  args = "gh-pages/**"
}

action "build gh-pages" {
  uses = "actions/docker/cli@8cdf801b322af5f369e00d85e9cf3a7122f49108"
  needs = ["gh-pages action"]
  args = "build -t cdssnc/gh-pages-github-action ./gh-pages"
}

action "push gh-pages" {
  uses = "actions/docker/cli@8cdf801b322af5f369e00d85e9cf3a7122f49108"
  needs = ["build gh-pages"]
  args = "push cdssnc/gh-pages-github-action"
}

workflow "a11y docker build" {
  on = "push"
  resolves = ["a11y deploy"]
}

action "a11y install" {
  uses = "docker://culturehq/actions-yarn:latest"
  args = "install"
}

action "a11y test" {
  uses = "docker://culturehq/actions-yarn:latest"
  needs = ["a11y install"]
  args = "test"
}

action "a11y is master" {
  uses = "actions/bin/filter@d820d56839906464fb7a57d1b4e1741cf5183efa"
  needs = ["a11y test"]
  args = "branch master"
}

action "a11y docker registry" {
  uses = "actions/docker/login@8cdf801b322af5f369e00d85e9cf3a7122f49108"
  needs = ["a11y is master"]
  secrets = ["DOCKER_USERNAME", "DOCKER_PASSWORD"]
}

action "a11y build" {
  uses = "docker://culturehq/actions-yarn:latest"
  needs = ["a11y docker registry"]
  args = "build -t cdssnc/a11y-checker-github-action ./a11y-checker"
}

action "a11y deploy" {
  uses = "actions/docker/cli@8cdf801b322af5f369e00d85e9cf3a7122f49108"
  needs = ["a11y build"]
  args = "push cdssnc/a11y-checker-github-action"
}
