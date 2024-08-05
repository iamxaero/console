# Set PATH
export PYENV_ROOT="$HOME/.pyenv"
export PIPENV_PYTHON="$PYENV_ROOT/shims/python"
export PATH="/usr/local/bin:/usr/local/sbin:/opt/local/bin/:/opt/local/sbin/:$HOME/bin:"$PYENV_ROOT/bin:$PATH""
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"

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

# ZSH
## If you come from bash you might have to change your $PATH.
ZSH_DISABLE_COMPFIX=true
## Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export LC_ALL=en_US.UTF-8
## See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="agnoster"
## ZSH_THEME="powerline"
plugins=(
  pyenv
  virtualenv
  git
  macos
  python
  docker
  docker-compose
  docker-machine
  kubectl
  sublime
  brew
  colorize
  helm
  history
  iterm2
  jsontools
  pip
  ansible
  branch
  github
  sudo
  zsh-syntax-highlighting
  zsh-autosuggestions
)
source $ZSH/oh-my-zsh.sh

# SSH
## export SSH_KEY_PATH="~/.ssh/rsa_id"
eval "$(ssh-agent)"
ssh-add ~/.ssh/hudson-6_rsa
ssh-add ~/.ssh/devops_rsa
ssh-add ~/.ssh/zulu_rsa
ssh-add ~/.ssh/zulu-jenkins_rsa
