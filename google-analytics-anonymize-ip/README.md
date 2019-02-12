# Google Analytics Anonymize IP GitHub Action

To use this GitHub action you need include it in your workflow file:

```
workflow "GA IP Check" {
  on = "deployment_status"
  resolves = [
    "check",
  ]
}

action "check" {
  uses = "docker://cdssnc/google-analytics-anonymize-ip-github-action:latest"
}
```

The workflow should trigger on a `deployment_status` [https://developer.github.com/v3/activity/events/types/#deploymentstatusevent](https://developer.github.com/v3/activity/events/types/#deploymentstatusevent), where the URL to check on is included in the `payload` field. This is the case with Heroku PR apps. The check will pass if anonymize Google Analytics events or do not have Google Analytics installed. If you have it installed and do not anonymize IPs, it will fail.
