# ------------------------------------
# PATH
# ------------------------------------
export PATH="$HOME/.local/bin:$PATH"
export PATH="/opt/homebrew/bin:/usr/local/bin:/usr/local/sbin:/opt/local/bin:/opt/local/sbin:$HOME/bin:$PATH"

# ------------------------------------
# Locale
# ------------------------------------
export LC_ALL=en_US.UTF-8

# ------------------------------------
# Ansible
# ------------------------------------
export ANSIBLE_VAULT_PASSWORD_FILE=~/.vault_pass
export ANSIBLE_LOG_PATH=~/.ansible/ansible.log
export ANSIBLE_STDOUT_CALLBACK='yaml'
export ANSIBLE_STRATEGY_PLUGINS=~/.ansible/plugins/mitogen
export ANSIBLE_CONFIG=~/.ansible/ansible.cfg

# ------------------------------------
# Golang
# ------------------------------------
export GOPATH="$HOME/.go"

# ------------------------------------
# Python — uv (pyenv мёртв)
# ------------------------------------
alias python="uv run python"
alias python3="uv run python"
alias pip="uv run python -m pip"
alias pip3="uv run python -m pip"

# ------------------------------------
# SSH
# ------------------------------------
eval "$(ssh-agent)" >/dev/null
if [[ -f "$HOME/.ssh/id_ed25519" ]]; then
  ssh-add ~/.ssh/id_ed25519
elif [[ -f "$HOME/.ssh/id_rsa" ]]; then
  ssh-add ~/.ssh/id_rsa
fi

# ------------------------------------
# Git Aliases
# ------------------------------------
alias ga="git add"
alias gaa="git add ."
alias gaaa="git add --all"
alias gau="git add --update"
alias gb="git branch"
alias gbd="git branch --delete "
alias gc="git commit"
alias gcm="git commit --message"
alias gcf="git commit --fixup"
alias gco="git checkout"
alias gcob="git checkout -b"
alias gcom="git checkout master"
alias gcos="git checkout staging"
alias gcod="git checkout develop"
alias gd="git diff"
alias gda="git diff HEAD"
alias gi="git init"
alias glg="git log --graph --oneline --decorate --all"
alias gld='git log --pretty=format:"%h %ad %s" --date=short --all'
alias gm="git merge --no-ff"
alias gma="git merge --abort"
alias gmc="git merge --continue"
alias gp="git pull"
alias gpr="git pull --rebase"
alias gr="git rebase"
alias gs="git status"
alias gss="git status --short"
alias gst="git stash"
alias gsta="git stash apply"
alias gstd="git stash drop"
alias gstl="git stash list"
alias gstp="git stash pop"
alias gsts="git stash save"
