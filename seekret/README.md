# Seekret scan GitHub Action

The purpose of this GitHub action is to scan your source code for strings that could potentially be secrets. It uses [seekret](https://github.com/apuigsech/seekret) to scan through your code and flag potential issues. It allows you to pass the specific global `seekret` overrides in the `args` field:

```
GLOBAL OPTIONS:
   --exception FILE, -x FILE    load exceptions from FILE.
   --rules PATH         PATH with rules. [$SEEKRET_RULES_PATH]
   --format value, -f value specify the output format. (default: "human")
   --known FILE, -k FILE  load known secrets from FILE.
   --workers value, -w value  number of workers used for the inspection (default: 4)
   --help, -h           show help
   --version, -v        print the version
```

Use the GitHub action in the following way:

```
workflow "Scan for secrets" {
  on = "push"
  resolves = ["Seekret"]
}

action "Seekret" {
  uses = "docker://cdssnc/seekret"
}

```

The resulting output will look something like this when it fails:

```
Found the following secrets:
---------------------------
/github/workspace/server.key
	1: [certs.rsa]   match: .*-----BEGIN RSA PRIVATE KEY-----.* false

```

It uses a set of rule files that can be found here:

[https://github.com/cds-snc/seekret/tree/master/rules](https://github.com/cds-snc/seekret/tree/master/rules)
