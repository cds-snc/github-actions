workflow "Lint dockerfiles" {
  on = "push"
  resolves = ["Lint docker files #2"]
}

action "Lint docker files #2" {
  uses = "docker://cdssnc/docker-lint"
  args = "--ignore DL3007"
}
