# CDS/SNC GitHub Actions

[![Phase](https://img.shields.io/badge/Phase-Beta-22a7f0.svg)](https://digital.canada.ca/products/)

```
With GitHub Actions you can automate your workflow from idea to production.
```

### Purpose

The purpose of this repository is to track all the GitHub actions CDS creates for their own purposes. Feel free to use these in your own workflows.

### Content

| Name                          | Description                                                                                                                                    | Use on              | Image name                                           | Size    |
| ----------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------- | ------------------- | ---------------------------------------------------- | ------- |
| auto-commit                   | Auto-commits back any changes to the current branch made by previous GitHub actions.                                                           | `push`              | `cdssnc/auto-commit-github-action`                   | 23 MB   |
| diefenbunker                  | Creates a zip file of your current GitHub workspace and uploads it to S3.                                                                      | any                 | `cdssnc/diefenbunker-github-action`                  | 32 MB   |
| docker-lint                   | Automatically runs [hadolint](https://github.com/hadolint/hadolint) on all the `Dockerfiles` in your repository.                               | `push`              | `cdssnc/docker-lint-github-action`                   | 26 MB   |
| elmo-fire                     | Sends a slack notification when a `check_suite` completes without a success state.                                                             | `check_suite`       | `cdssnc/elmo-fire-github-action`                     | 6 MB    |
| gh-pages                      | Pushes a DIR to GH pages. Security fork from [here](https://github.com/maxheld83/ghpages).                                                     | `push`              | `cdssnc/gh-pages-github-action`                      | 13 MB   |
| google-analytics-anonymize-ip | Checks a deployment if it is uses IP anonymization when using Google Analytics                                                                 | `deployment_status` | `cdssnc/google-analytics-anonymize-ip-github-action` | 1.44 GB |
| lighthouse-score              | Checks a deployment lighthouse-scores against a user defined baseline                                                                          | `deployment_status` | `cdssnc/lighthouse-score-github-action`              | 6 MB    |
| node-license-checker          | Automatically runs [license-checker](https://github.com/davglass/license-checker) to extract all the license information in your dependencies. | `push`              | `cdssnc/node-license-checker-github-action`          | 26 MB   |
| seekret                       | Checks if files contain secrets you do not want to expose                                                                                      | `push`              | `cdssnc/seekret-github-action`                       | 59.7 MB |
| tf-lint                       | Automatically runs [tflint](https://github.com/wata727/tflint) on all the Terraform (`.tf`) in your repository.                                | `push`              | `cdssnc/tf-lint-github-action`                       | 27 MB   |
| touched                       | Checks if file matching a pattern have been touched as part of the push                                                                        | `push`              | `cdssnc/touched-github-action`                       | 1.88 MB |
| a11y-checker                  | Basic accessibility scanner for deployments                                                                                                    | `deployment_status` | `cdssnc/a11y-checker`                                 | 515 MB |
| a11y-multiple-pagechecker     | Accessibility scanner for multiple page deployments                                                                                            | `deployment_status` | `cdssnc/a11y-multiple-page-checker`                   | 319 MB |

### Questions?

Please contact us through any of the multiple ways listed on our [website](https://digital.canada.ca/).
