workflow "a11y docker build" {
  on = "push"
  resolves = ["a11y deploy"]
}

action "a11y install" {
  uses = "docker://culturehq/actions-yarn:latest"
  runs = "[\"sh\", \"-c\", \"cd a11y-checker && yarn install\"]"
}

action "a11y test" {
  uses = "docker://culturehq/actions-yarn:latest"
  needs = ["a11y install"]
  runs = "sh -c cd a11y-checker && yarn test"
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
