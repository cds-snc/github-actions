# Auto-commit GitHub Action

**Note:** You need to use the actions/checkout@**v2** for this action to work. See [#23](https://github.com/cds-snc/github-actions/issues/23) for more info.

The purpose of this GitHub action is to auto-commit back any changes made to the branch through previous GitHub actions. This allows you to export build scripts into GitHub Actions. GitHub appears to be smart enough not to run CI on commits made by a GitHub action.

![screen shot 2019-02-19 at 9 06 03 am](https://user-images.githubusercontent.com/867334/53020783-b2389e00-3425-11e9-8d05-273c5e8f7d1d.png)

Use the GitHub action in the following way:

```
action "Filter master" {
  uses = "actions/bin/filter@46ffca7632504e61db2d4cb16be1e80f333cb859"
  args = "not branch master"
}

action "Some action that changes files" {
  uses = "..."
  args = "..."
}

action "Auto-commit" {
  uses = "docker://cdssnc/auto-commit-github-action"
  needs = ["Some action that changes files"]
  args = "This is an auto-commit"
  secrets = ["GITHUB_TOKEN"]
}
```

This ensures that you run your action only on a non-master branch. The `args` field is used as your commit message. To modify the commit name, copy the code and change the name in 'entrypoint.sh'.
