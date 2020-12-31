Add the following to `~/.zshrc`:

```
aws-profiles() {
  cat $(ls -d ~/.aws/* | egrep "config|credentials") \
    | perl -ne 'print "$1\n" if /\[(?:profile)?\s?(.*)\]/s'
}

set-aws-profile() {
  local aws_profile=$1
  set -x
  export AWS_PROFILE=${aws_profile}
  set +x
}
```
