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
