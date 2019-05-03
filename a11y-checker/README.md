# Accessibility Checker

The purpose of this github action is to perform basic automated accessibility checking on Pull Requests.
This action uses [axe-puppeteer](https://github.com/dequelabs/axe-puppeteer) to analyse deployments from Pull Requests. If any violations are found, CI will fail for the commit. The specific violations can be found by inspecting the details of the failed action.

Use this action with ```on = "deployment_status"``` as part of your github workflow.