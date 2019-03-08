workflow "Lint dockerfiles" {
  on = "push"
  resolves = ["Lint docker files"]
}

action "Lint docker files" {
  uses = "docker://cdssnc/docker-lint"
}
