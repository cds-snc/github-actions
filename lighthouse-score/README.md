# LighthouseScore GitHub Action

The purpose of this GitHub action is to run lighthouse on URL specified in a `deployment_status` event. This is intended to be used with the [lighthouse cloud function](https://github.com/cds-snc/lighthouse-cloud). Therefore it requires the following `ENV` variables:

| NAME              | PURPOSE                                               |
| ----------------- | ----------------------------------------------------- |
| LIGHTHOUSE_URL    | The full URL of your Lighthouse cloud function        |
| LIGHTHOUSE_SECRET | The secret that guards your Lighthouse cloud function |

Lighthouse currently returns scores in five categories. 

```
performance
accessibility
best-practices
seo
pwa
```

The app currently expects all scores to be above `0`. To specify your own baseline scores you can use the `LIGHTHOUSE_SCORES` environment variable. For example if you want all of them to be `50`, you would specificy them in a JSON array in the order listed above. ex: `LIGHTHOUSE_SCORES = "[50, 50, 50, 50, 50]"`


Use the GitHub action in the following way:

```
workflow "Lighthouse score" {
  on = "deployment_status"
  resolves = ["Check lighthouse"]
}

action "lighthouse" {
  uses = "docker://cdssnc/lighthouse-score-github-action"
  env = {
    LIGHTHOUSE_URL = "https://us-central1 ... /scanURL",
    LIGHTHOUSE_SCECRET = "foo",
    LIGHTHOUSE_SCORES = "[50, 50, 50, 50, 50]"
  }

```
