# Powerline
powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
# Need to be install: pip install powerline-status
# and set your global Python versioan in path
source "$PYENV_VIRTUAL_ENV/lib/python3.11/site-packages/powerline/bindings/bash/powerline.sh"

# Set PATH
export PYENV_ROOT="$HOME/.pyenv"
export PIPENV_PYTHON="$PYENV_ROOT/shims/python"
export PATH="/usr/local/bin:/usr/local/sbin:/opt/local/bin/:/opt/local/sbin/:$HOME/bin:"$PYENV_ROOT/bin:$PATH""

# Ansible
export ANSIBLE_VAULT_PASSWORD_FILE=~/.vault_pass
export ANSIBLE_LOG_PATH=~/.ansible/ansible.log
export ANSIBLE_STDOUT_CALLBACK='yaml'
export ANSIBLE_STRATEGY_PLUGINS=~/.ansible/plugins/mitogen
export ANSIBLE_CONFIG=~/.ansible/ansible.cfg

# Golang
export GOPATH="$HOME/.go"

# Set Python envirompments
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init --path)"
  eval "$(pyenv virtualenv-init -)"
fi

# SSH
## export SSH_KEY_PATH="~/.ssh/rsa_id"
eval "$(ssh-agent)"
ssh-add ~/.ssh/devops_rsa

# ----------------------
# Git Aliases
# ----------------------
alias ga='git add'
alias gaa='git add .'
alias gaaa='git add --all'
alias gau='git add --update'
alias gb='git branch'
alias gbd='git branch --delete '
alias gc='git commit'
alias gcm='git commit --message'
alias gcf='git commit --fixup'
alias gco='git checkout'
alias gcob='git checkout -b'
alias gcom='git checkout master'
alias gcos='git checkout staging'
alias gcod='git checkout develop'
alias gd='git diff'
alias gda='git diff HEAD'
alias gi='git init'
alias glg='git log --graph --oneline --decorate --all'
alias gld='git log --pretty=format:"%h %ad %s" --date=short --all'
alias gm='git merge --no-ff'
alias gma='git merge --abort'
alias gmc='git merge --continue'
alias gp='git pull'
alias gpr='git pull --rebase'
alias gr='git rebase'
alias gs='git status'
alias gss='git status --short'
alias gst='git stash'
alias gsta='git stash apply'
alias gstd='git stash drop'
alias gstl='git stash list'
alias gstp='git stash pop'
alias gsts='git stash save'
