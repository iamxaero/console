export ANSIBLE_VAULT_PASSWORD_FILE=~/.vault_pass
export ANSIBLE_LOG_PATH=~/.ansible/ansible.log
export ANSIBLE_STDOUT_CALLBACK='yaml'
export ANSIBLE_STRATEGY_PLUGINS=~/.ansible/plugins/mitogen

export PYENV_ROOT="$HOME/.pyenv"
export GOPATH="$HOME/go"

export PATH="/usr/local/bin:/usr/local/sbin:/opt/local/bin/:/opt/local/sbin/:$PYENV_ROOT/bin:$PATH:$HOME/bin"
# for python envirompments
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init --path)"
fi

# If you come from bash you might have to change your $PATH.
ZSH_DISABLE_COMPFIX=true

# Path to your oh-my-zsh installation.
export ZSH=/Users/xaero/.oh-my-zsh
export LC_ALL=en_US.UTF-8

# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="agnoster"
# ZSH_THEME="powerline"

plugins=(
  pyenv
  virtualenv
  git
  osx
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

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"
eval "$(ssh-agent)"
ssh-add ~/.ssh/devops_rsa

