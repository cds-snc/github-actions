# Touched GitHub Action

The purpose of this GitHub action is pass if a files matching a specific pattern have been touched inside a push. If they have been, the action will pass. If not, the action will terminate with a neutral exit code. The idea is to conditionally run actions only if cetain files have been touched.

Use the GitHub action in the following way:

```
action "Images touched?" {
  uses = "docker://cdssnc/touched-github-action"
  args = "{**jpg,**png}"
}
```

The pattern syntax is based on the [Crystal Lang pattern syntax](https://crystal-lang.org/api/0.27.2/File.html#match%3F%28pattern%3AString%2Cpath%3AString%29-class-method).
