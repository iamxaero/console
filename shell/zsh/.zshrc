# ------------------------------------
# PATH
# ------------------------------------
export PATH="$HOME/.local/bin:$PATH"
export PATH="/usr/local/bin:/usr/local/sbin:/opt/local/bin:/opt/homebrew/bin:/opt/local/sbin:$HOME/bin:$PATH"

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
# Remove pyenv (UV лучше)
# ------------------------------------
# if command -v pyenv 1>/dev/null 2>&1; then
#   export PYENV_ROOT="$HOME/.pyenv"
#   export PATH="$PYENV_ROOT/bin:$PATH"
#   eval "$(pyenv init --path)"
#   eval "$(pyenv virtualenv-init -)"
# fi
# Python uv global aliases
alias python="uv run python"
alias python3="uv run python"
alias pip="uv run python -m pip"
alias pip3="uv run python -m pip"

# ------------------------------------
# Oh-My-Zsh
# ------------------------------------
ZSH_DISABLE_COMPFIX=true
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="agnoster"

plugins=(
  aws
  golang
  git
  gitfast
  macos
  command-not-found
  zsh-autosuggestions
  zsh-syntax-highlighting
  zsh-colorize
  history-substring-search
  helm
  iterm2
  kubectl
  jsontools
  ansible
  github
  sudo
  terraform
  thefuck
  docker
  docker-compose
  zsh-interactive-cd
  zsh-navigation-tools
  uv
)

source $ZSH/oh-my-zsh.sh

# ------------------------------------
# SSH
# ------------------------------------
eval "$(ssh-agent)" >/dev/null
if [[ -f "$HOME/.ssh/id_ed25519" ]]; then
  ssh-add ~/.ssh/id_ed25519
elif [[ -f "$HOME/.ssh/id_rsa" ]]; then
  ssh-add ~/.ssh/id_rsa
fi

