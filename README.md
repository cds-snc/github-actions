# CDS/SNC GitHub Actions

This repo contains custom GitHub actions for CDN/SNC.

| Name                          | Description                                                                          | Use on              |
| ----------------------------- | ------------------------------------------------------------------------------------ | ------------------- |
| auto-commit                   | Auto-commits back any changes to the current branch made by previous GitHub actions. | `push`              |
| google-analytics-anonymize-ip | Checks a deployment if it is uses IP anonymization when using Google Analytics       | `deployment_status` |
| touched                       | Checks if file matching a pattern have been touched as part of the push              | `push`              |
