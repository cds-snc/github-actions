# ElmoFire GitHub Action

The purpose of this GitHub action is send a slack notification through a webhook if a `check_suite` on GitHub  completes without a success state. Ironically it does not run on GitHub actions - presumably to not create infinit loops. All you need to do is specify a `SLACK_WEBHOOK_URL` to post to.

Use the GitHub action in the following way:

```
workflow "Branch is failing" {
  on = "check_suite"
  resolves = ["Tests are failing"]
}

action "Tests are failing" {
  uses = "docker://cdssnc/elmo-fire-github-action"
  env = {
    SLACK_WEBHOOK_URL = "https://hooks.slack.com/services/...."
  }

```
