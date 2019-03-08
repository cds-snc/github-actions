workflow "Lint dockerfiles" {
  on = "push"
  resolves = ["docker://cdssnc/docker-lint"]
}

action "docker://cdssnc/docker-lint" {
  uses = "docker://cdssnc/docker-lint"
}
