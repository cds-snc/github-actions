# a11y Multiple Page Checker

The purpose of this github action is to perform basic automated accessibility checking on multiple page deployments from Pull Requests.

This action differs from the single page a11y-checker also in this repo. This action will scan multiple pages of a deployed application based on an a11y.json config file. Create and place a11y.json in the root folder of your repository.

Example a11y.json:
```
{
  "urls": [
    "",
    "about"
  ]
}
```
Note that urls should not contain a preceeding "/".

This action is comprised of two parts: A github action and a Google Cloud Run action. The github action parses a11y.json for the list of urls to scan. Each scan request is sent to the GCR action, allowing multiple pages to be scanned simultaneously. Once all requests have been returned, the github action will report either a pass or a failure, and log any failures.

This action uses [axe-puppeteer](https://github.com/dequelabs/axe-puppeteer) to analyse deployments from Pull Requests. If any violations are found, CI will fail for the commit. The specific violations can be found by inspecting the details of the failed action.

Use this action with ```on = "deployment_status"``` as part of your github workflow.