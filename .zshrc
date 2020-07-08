export BROWSER=/bin/true

eval `ssh-agent`
ssh-add $HOME/.ssh/id_rsa

alias ssh="ssh -A"

aws-profiles() {
  cat $(ls -d ~/.aws/* | egrep "config|credentials") | grep '\[' | grep -v '#' | tr -d '[' | tr -d ']' | sed 's/^profile\s//g'
}

set-aws-profile() {
  local aws_profile=$1
  set -x
  export AWS_PROFILE=${aws_profile}
  set +x
}
