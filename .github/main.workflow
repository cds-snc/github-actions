workflow "Lint dockerfiles" {
  on = "push"
  resolves = ["Lint docker files #1"]
}

action "Lint docker files #1" {
  uses = "docker://cdssnc/docker-lint"
  args = "--ignore DL3003"
}
