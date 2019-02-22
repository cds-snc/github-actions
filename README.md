# CDS/SNC GitHub Actions

This repo contains custom GitHub actions for CDN/SNC.

| Name                          | Description                                                                          | Use on              | Image name                                           | Size    |
| ----------------------------- | ------------------------------------------------------------------------------------ | ------------------- | ---------------------------------------------------- | ------- |
| auto-commit                   | Auto-commits back any changes to the current branch made by previous GitHub actions. | `push`              | `cdssnc/auto-commit-github-action`                   | 23 MB   |
| google-analytics-anonymize-ip | Checks a deployment if it is uses IP anonymization when using Google Analytics       | `deployment_status` | `cdssnc/google-analytics-anonymize-ip-github-action` | 1.44 GB |
| touched                       | Checks if file matching a pattern have been touched as part of the push              | `push`              | `cdssnc/auto-commit-github-action`                   | 1.88 MB |
