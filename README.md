# CDS/SNC GitHub Actions

[![Phase](https://img.shields.io/badge/Phase-Beta-22a7f0.svg)](https://digital.canada.ca/products/)

```
With GitHub Actions you can automate your workflow from idea to production.
```

### Purpose

The purpose of this repository is to track all the GitHub actions CDS creates for their own purposes. Feel free to use these in your own workflows.

### Content

| Name                          | Description                                                                                                      | Use on              | Image name                                           | Size    |
| ----------------------------- | ---------------------------------------------------------------------------------------------------------------- | ------------------- | ---------------------------------------------------- | ------- |
| auto-commit                   | Auto-commits back any changes to the current branch made by previous GitHub actions.                             | `push`              | `cdssnc/auto-commit-github-action`                   | 23 MB   |
| docker-lint                   | Automatically runs [hadolint](https://github.com/hadolint/hadolint) on all the `Dockerfiles` in your repository. | `push`              | `cdssnc/docker-lint`                                 | 26 MB   |
| google-analytics-anonymize-ip | Checks a deployment if it is uses IP anonymization when using Google Analytics                                   | `deployment_status` | `cdssnc/google-analytics-anonymize-ip-github-action` | 1.44 GB |
| touched                       | Checks if file matching a pattern have been touched as part of the push                                          | `push`              | `cdssnc/auto-commit-github-action`                   | 1.88 MB |

### Questions?

Please contact us through any of the multiple ways listed on our [website](https://digital.canada.ca/).
