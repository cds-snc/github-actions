# Docker lint GitHub Action

The purpose of this GitHub action is to lint your Terraform files. It uses [tflint](https://github.com/wata727/tflint) to lint all your `.tf` files. It allows you to pass the specific `tflint` overrides in the `args` field:

```
  -v, --version                             Print TFLint version
  -f, --format=[default|json|checkstyle]    Output format (default: default)
  -c, --config=FILE                         Config file name (default: .tflint.hcl)
      --ignore-module=SOURCE1,SOURCE2...    Ignore module sources
      --ignore-rule=RULE1,RULE2...          Ignore rule names
      --var-file=FILE1,FILE2...             Terraform variable file names
      --deep                                Enable deep check mode
      --aws-access-key=ACCESS_KEY           AWS access key used in deep check mode
      --aws-secret-key=SECRET_KEY           AWS secret key used in deep check mode
      --aws-profile=PROFILE                 AWS shared credential profile name used in deep check mode
      --aws-region=REGION                   AWS region used in deep check mode
  -d, --debug                               Enable debug mode
      --error-with-issues                   Return error code when issues exist
      --fast                                Ignore slow rules. Currently, ignore only aws_instance_invalid_ami
  -q, --quiet                               Do not output any message when no issues are found (Format=default only)
```

Use the GitHub action in the following way:

```
workflow "Lint all Terraform files" {
  on = "push"
  resolves = ["Linter"]
}

action "Linter" {
  uses = "docker://cdssnc/tf-lint-github-action"
  args = "--fast"
}

```

The resulting output will look something like this when it fails:

```
Searching for Terraform files ...
-----------------------------
Processing ./github/workspace/test.tf

Found the following issues:
---------------------------
./github/workspace/test.tf
	ERROR:3 "t1.2xlarge" is invalid instance type. (aws_instance_invalid_type)

Result: 1 issues  (1 errors , 0 warnings , 0 notices)
```
