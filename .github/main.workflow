workflow "Lint dockerfiles" {
  on = "push"
  resolves = ["Lint docker files"]
}

action "Lint docker files" {
  uses = "docker://cdssnc/docker-lint"
}

workflow "Branch is failing" {
  on = "check_suite"
  resolves = ["Tests are failing"]
}

action "Tests are failing" {
  uses = "docker://cdssnc/elmo-fire-github-action"
  env = {
    SLACK_WEBHOOK_URL = "https://hooks.slack.com/services/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"
  }
}
