# Diefenbunker

The purpose of this GitHub action is to backup the contents of your GitHub Workspace to S3. It does this by creating zip file of your code and uploading it to an S3 bucket. This is intended to be used with the [s3cmd](https://github.com/s3tools/s3cmd). Therefore it requires the following `ENV` variables:

| NAME           | PURPOSE                                              |
| -------------- | ---------------------------------------------------- |
| AWS_KEY        | Your S3 AWS access key                               |
| AWS_SECRET     | Your S3 AWS access secret                            |
| S3_DESTINATION | Your bucket URL, starts with `s3://` ends with a `/` |


Use the GitHub action in the following way:

```
workflow "Backup master" {
  on = "push"
  resolves = ["Run S3 backup"]
}

action "Filter master" {
  uses = "actions/bin/filter@46ffca7632504e61db2d4cb16be1e80f333cb859"
  args = "branch master"
}


action "Run S3 backup" {
  uses = "docker://cdssnc/diefenbunker-github-action"
  needs = ["Filter master"]
  env = {
    AWS_KEY = "...",
    AWS_SECRET = "...",
    S3_DESTINATION = "s3://cds-github/diefenbunker/"
  }

```