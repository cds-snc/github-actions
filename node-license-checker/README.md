# Node license checker GitHub Action

Thank you to [@calvinrodo](https://github.com/calvinrodo) for pointing us in the right direction.

The purpose of this GitHub action is to scan the licenses of your node dependencies to check for incompatibilities. It uses [license-checker](https://github.com/davglass/license-checker) to scan through your dependencies and flag potential issues. It allows you to pass the specific arguments in the `args` field. If you do not define a `--failOn` it will always pass:

* `--production` only show production dependencies.
* `--development` only show development dependencies.
* `--start [path of the initial json to look for]`
* `--unknown` report guessed licenses as unknown licenses.
* `--onlyunknown` only list packages with unknown or guessed licenses.
* `--json` output in json format.
* `--csv` output in csv format.
* `--csvComponentPrefix` prefix column for component in csv format.
* `--out [filepath]` write the data to a specific file.
* `--customPath` to add a custom Format file in JSON
* `--exclude [list]` exclude modules which licenses are in the comma-separated list from the output
* `--relativeLicensePath` output the location of the license files as relative paths
* `--summary` output a summary of the license usage',
* `--failOn [list]` fail (exit with code 1) on the first occurrence of the licenses of the semicolon-separated list
* `--onlyAllow [list]` fail (exit with code 1) on the first occurrence of the licenses not in the semicolon-seperated list
* `--packages [list]` restrict output to the packages (package@version) in the semicolon-seperated list
* `--excludePackages [list]` restrict output to the packages (package@version) not in the semicolon-seperated list
* `--excludePrivatePackages` restrict output to not include any package marked as private
* `--direct look for direct dependencies only`

Use the GitHub action in the following way:

```
workflow "Scan for license issues" {
  on = "push"
  resolves = ["license-checker"]
}

action "license-checker" {
  uses = "docker://cdssnc/node-license-checker-github-action",
  args = "--onlyAllow 'MIT; MIT OR X11; BSD; ISC'"
}

```

The resulting output will look something like this when it fails:

```
Searching for license issues ...

Package "@cdssnc/bad-license@0.0.2" is licensed under "UNKNOWN" which is not permitted by the --onlyAllow flag. Exiting.

The license checker found issues with the flags your provided. See above.
```

For more information check here:
[https://github.com/davglass/license-checker](https://github.com/davglass/license-checker)
