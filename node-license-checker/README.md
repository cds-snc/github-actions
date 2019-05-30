# Node license checker GitHub Action

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

To determine what args value to use:
Is the modified application going to be used as a web application? If Yes: You can accept any OSI approved licence or FSF free software licence except strong reciprocal licences.
This arg contains the most common permissive and reciprocal licenses to check for:
` args = "--onlyAllow 'Apache; BSD; ISC; MIT; X11; EPL; EUPL; GPL; LGPL; AGPL; MPL; OSL'" `

Is the modified application going to be distributed externally, outside the GC, either the source code or the binary? If Yes: Only use permissive licenses.
The following arg contains the most common permissive licenses to check for:
` args = "--onlyAllow 'Apache; BSD; ISC; MIT; X11'" `

The resulting output will look something like this when it fails:

```
Searching for license issues ...

Package "@cdssnc/bad-license@0.0.2" is licensed under "UNKNOWN" which is not permitted by the --onlyAllow flag. Exiting.

The license checker found issues with the flags your provided. See above.
```

A list of liceses to use can be found here:
[https://github.com/canada-ca/open-source-logiciel-libre/blob/master/en/guides/using-open-source-software.md#annex-a](https://github.com/canada-ca/open-source-logiciel-libre/blob/master/en/guides/using-open-source-software.md#annex-a)

For more information check here:
[https://github.com/davglass/license-checker](https://github.com/davglass/license-checker)

Thank you to [@calvinrodo](https://github.com/calvinrodo) for pointing us in the right direction.
