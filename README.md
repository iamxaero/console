# Console — DevOps Environment Setup

> Полный набор конфигов DevOps-окружения. Каждое приложение — отдельная директория с README и пошаговыми инструкциями по настройке.
>
> **Заметка:** В проекте нет персональных данных. При настройке на новой машине замените placeholder'ы (email, name) на свои.

---

## Applications

| Приложение | Директория | Описание |
|---|---|---|
| **Shell** (zsh + bash) | [shell/](shell/) | .zshrc с Oh-My-Zsh (23 плагина), .bashrc, .inputrc |
| **iTerm2** | [iterm2/](iterm2/) | Полный экспорт конфига, 2 профиля, цветовые палитры |
| **Neovim** | [neovim/](neovim/) | init.vim, dein.vim, 73 плагина, deoplete, LSP-ready |
| **Vim** (legacy) | [vim/](vim/) | .vimrc, Vundle, бэквёрд-совместимость |
| **Ansible** | [ansible/](ansible/) | ansible.cfg, vault, inventory, roles |
| **Git** | [git/](git/) | .gitconfig, ~60 алиасов, rebase workflow |
| **YADR** | [yadr/](yadr/) | Legacy dotfiles (Prezto, Vundle, Tmux) |

## Quick Start

```bash
# Полная настройка (см. разделы ниже)
# Или настройка конкретного приложения:
cd console && cat <app>/README.md
```

## Table of Contents

1. [Prerequisites](#1-prerequisites)
2. [Homebrew](#2-homebrew)
3. [Shell (zsh + Oh-My-Zsh)](#3-shell-zsh--oh-my-zsh)
4. [Shell plugins](#4-shell-plugins)
5. [Config symlinks](#5-config-symlinks)
6. [Powerline fonts](#6-powerline-fonts)
7. [iTerm2](#7-iterm2)
8. [Python (uv)](#8-python-uv)
9. [Neovim](#9-neovim)
10. [Classic Vim (legacy)](#10-classic-vim-legacy)
11. [Ansible](#11-ansible)
12. [Golang](#12-golang)
13. [SSH](#13-ssh)
14. [Git](#14-git)
15. [Summary — checklist](#summary---checklist)

> **Tip:** For details on each application, see its directory:
> - [Shell](shell/README.md)
> - [iTerm2](iterm2/README.md)
> - [Neovim](neovim/README.md)
> - [Vim](vim/README.md)
> - [Ansible](ansible/README.md)
> - [Git](git/README.md)

---

## 1. Prerequisites

- macOS (based on paths `/opt/homebrew`, Apple Silicon / M-series is expected)
- Xcode Command Line Tools

```bash
xcode-select --install
```

## 2. Homebrew

Install Homebrew (if not already installed):

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Update:

```bash
brew update
```

## 3. Shell (zsh + Oh-My-Zsh)

### Install zsh

```bash
brew install zsh
# Add to login shells list
sudo sh -c 'echo $(which zsh) >> /etc/shells'
chsh -s $(which zsh)
```

### Install Oh-My-Zsh

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
```

### Configuration

See: [shell/zsh/README.md](shell/zsh/README.md)

#### Key settings in `.zshrc`:

| Parameter | Value |
|---|---|
| Theme | `agnoster` |
| ZSH_DISABLE_COMPFIX | `true` |
| Plugins | aws, golang, git, gitfast, macos, command-not-found, zsh-autosuggestions, zsh-syntax-highlighting, colorize, history-substring-search, helm, iterm2, kubectl, jsontools, ansible, github, sudo, terraform, thefuck, docker, docker-compose, zsh-interactive-cd, zsh-navigation-tools, uv |
| PATH | `$HOME/.local/bin`, `/usr/local/bin`, `/usr/local/sbin`, `/opt/homebrew/bin`, `/opt/local/bin`, `/opt/local/sbin`, `$HOME/bin` |
| Locale | `en_US.UTF-8` |

#### Python / uv aliases:

```bash
alias python="uv run python"
alias python3="uv run python"
alias pip="uv run python -m pip"
alias pip3="uv run python -m pip"
```

> **Note:** pyenv is commented out — uv is used instead of pyenv.

#### SSH setup:

```bash
eval "$(ssh-agent)" >/dev/null
# Add your keys
for key in ~/.ssh/id_ed25519 ~/.ssh/id_rsa; do
  [[ -f "$key" ]] && ssh-add "$key"
done
```

## 4. Shell plugins

```bash
# zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions

# zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
```

## 5. Config symlinks

```bash
# Readline config (bash, python REPL, etc.)
ln -sf $(pwd)/console/shell/.inputrc ~/.inputrc

# Bash (if used)
ln -sf $(pwd)/console/shell/bash/.bashrc ~/.bashrc
```

### `.inputrc`

```
"E[A": history-search-backward
"E[B": history-search-forward
```

> Searches from history when pressing ↑/↓ — very convenient for commands with a prefix.

## 6. Powerline fonts

```bash
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
cd ..
rm -rf fonts
```

> These fonts are needed for correct display of icons in the `agnoster` theme (powerlevel9k/agnoster uses special glyphs).

## 7. iTerm2

### Full config

See: [iterm2/README.md](iterm2/README.md)

### Installation

Import `iterm2-full-config/Settings.json` via iTerm2 GUI:
- iTerm2 → Settings → General → drag Settings.json
- **Import...** → select the file

### Updating the config

When making changes in iTerm2, export again:

```bash
defaults read ~/Library/Preferences/com.googlecode.iterm2 \
  > console/iterm2/iterm2-full-config/Settings.json
```

## 8. Python (uv)

uv is a fast Python version and virtual environment manager (alternative to pyenv).

```bash
# Install
brew install uv

# List available versions
uv python list

# Install a specific version
uv python install 3.14

# Set as global default
uv python pin --global 3.14
```

> **pyenv** is commented out in `.bashrc`. If needed — uncomment the `Remove pyenv (UV is better)` section.

## 9. Neovim

### Installation

```bash
brew install neovim
```

### Config symlink

```bash
ln -sf $(pwd)/console/neovim ~/.config/nvim
```

### Neovim config architecture

```
~/.config/nvim/
├── init.vim          # Main config, loads plugins.vim and settings.vim
├── plugins.vim       # dein.vim plugin manager: loads dein and all plugin/*.vim
├── settings.vim      # Dynamically loads all settings/*.vim
├── dein/             # dein.vim (plugin manager, cloned automatically)
├── thex/             # Local plugin (autoload)
├── plugins/          # Define all dependencies via dein#add()
│   ├── base.vim      # unite, vimfiler, vimshell, deoplete, vimproc, tpope/*, session, etc.
│   ├── languages.vim # syntastic, polyglot, markdown, javascript, rust, go, hcl, etc.
│   ├── git.vim       # gitv, gist, fugitive, git, gitgutter
│   ├── appearance.vim# colorizer, solarized, lightline
│   ├── search.vim    # sneak, ag, easymotion, greplace, etc.
│   ├── textobjects.vim# kana/*, textobj-* family, indent-guides
│   └── vim-improvements.vim # splitjoin, delimitMate, multiple-cursors, etc.
├── settings/         # Plugin configs
│   ├── appearance.vim
│   ├── binary-hex.vim
│   ├── deoplete.vim
│   ├── lang-javascript.vim
│   ├── lightline.vim
│   ├── unite.vim
│   ├── vim-fold.vim
│   ├── vim-ident-guides.vim
│   ├── vim-session.vim
│   ├── vim-whitespace.vim
│   └── vimfiller.vim
└── pack/
    └── kite/         # kite autocomplete (optional)
```

### Key Neovim plugins (dein.vim):

| Category | Plugins |
|---|---|
| **Plugin Manager** | dein.vim |
| **UI** | lightline.vim, vim-colors-solarized, colorizer |
| **Navigation** | unite.vim, vimfiler.vim, vimshell.vim, xolox/vim-session |
| **Auto-completion** | deoplete.nvim, vimproc.vim |
| **Git** | vim-fugitive, vim-git, vim-gitgutter, gitv, gist-vim |
| **Languages** | vim-polyglot, vim-go, rust.vim, syntastic, vim-flavored-markdown, vim-javascript, Vim-Jinja2-Syntax, vim-hclfmt, logstash.vim, syslog-ng |
| **Search** | vim-sneak, ag.vim, vim-easymotion, greplace.vim |
| **Text Objects** | kana/vim-textobj-*, nathanaelkane/vim-indent-guides |
| **Editing** | splitjoin.vim, delimitMate, tcomment_vim, multiple-cursors, yankring, change-inside-surroundings, tabular |
| **Misc** | vim-surround, vim-repeat, vim-abolish, vim-endwise, matchit, NrrwRgn, investigate.vim, gundo.vim |

### Installing plugins

```bash
# Open Neovim
nvim

# Then inside vim run:
# :call dein#install()
```

> dein.vim automatically clones all dependencies from `plugins/*.vim` on first launch.

## 10. Classic Vim (legacy)

### Install Vim

```bash
brew install vim
```

### Symlink

```bash
# Main config
ln -sf $(pwd)/console/vim/.vimrc ~/.vimrc

# Bundle directory (Vundle)
ln -sf $(pwd)/console/vim ~/.vim
```

### Vundle plugins (`~/.vim/vundles.vim`)

| File | Category |
|---|---|
| ruby.vundle | Ruby plugins |
| languages.vundle | Language packs |
| git.vundle | Git tools |
| appearance.vundle | Colors and UI |
| textobjects.vundle | Text objects |
| search.vundle | Search |
| project.vundle | Projects |
| vim-improvements.vundle | Vim improvements |

### Installing Vundle plugins

```bash
vim --noplugin -u ~/.vim/vundles.vim -N "+set hidden" "+syntax on" +BundleClean! +BundleInstall +qall
```

## 11. Ansible

### Installation

```bash
brew install ansible
```

### Configuration

```bash
# Ansible config
mkdir -p ~/.ansible
ln -sf $(pwd)/console/ansible/ansible.cfg ~/.ansible/ansible.cfg

# Vault password (DO NOT commit this file!)
openssl rand -base64 32 > ~/.vault_pass
chmod 600 ~/.vault_pass
```

### Key `ansible.cfg` settings:

| Parameter | Value |
|---|---|
| `nocows` | 1 |
| `gathering` | smart |
| `fact_caching_timeout` | 7200 |
| `retry_files_enabled` | False |
| `forks` | 20 |
| `timeout` | 60 |
| `transport` | ssh |
| `pipelining` | True |
| `vault_password_file` | `~/.vault_pass` (create manually) |
| `inventory` | `inventory` (relative to ~/.ansible) |
| `library` | `library/modules` |
| `roles_path` | `roles/vendor` |
| `ssh_args` | `-C -o ControlMaster=auto -o ControlPersist=60s -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no` |

### Environment variables (from .zshrc):

```bash
export ANSIBLE_VAULT_PASSWORD_FILE=~/.vault_pass
export ANSIBLE_LOG_PATH=~/.ansible/ansible.log
export ANSIBLE_STDOUT_CALLBACK='yaml'
export ANSIBLE_STRATEGY_PLUGINS=~/.ansible/plugins/mitogen
export ANSIBLE_CONFIG=~/.ansible/ansible.cfg
```

> **Important:** Mitogen strategy plugins are required — but the path `~/.ansible/plugins/mitogen` must point to an installed mitogen.

## 12. Golang

```bash
# Create GOPATH
mkdir -p ~/.go
```

> GOPATH is set to `~/.go` (configured in `.zshrc`).

## 14. Git

### Install config

```bash
# Symlink
ln -sf $(pwd)/console/git/gitconfig ~/.gitconfig
```

### Key `.gitconfig` settings:

| Parameter | Value |
|---|---|
| `core.editor` | `nvim` |
| `pull.rebase` | `true` |
| `push.default` | `current` |
| `push.followTags` | `true` |
| `merge.ff` | `no-ff` |
| `user.signingkey` | `~/.ssh/id_ed25519` |
| `credential.helper` | `cache --timeout=3600` |

### Aliases

~60 aliases: `st`, `lg`, `gco`, `gcob`, `gs`, `gp`, `gpr`, `gr`, `gst`, `gaa`, `gm`, `gpf`, `w` (worktree), etc.

> **Note:** `.gitconfig` is a full DevOps engineer config. Email/name/keys must be adapted to your own.

## 15. SSH

### Keys

SSH key addition is configured in `.zshrc`:

1. `~/.ssh/id_ed25519` (priority)
2. `~/.ssh/id_rsa` (fallback)

**What to do manually:**

```bash
# Copy/create SSH keys
# 1. Or create new:
ssh-keygen -t ed25519 -C "devops@example.com"

# 2. Or copy existing from backup
# Add public key to GitHub, GitLab, etc.
```

## Summary — checklist

| # | Step | Command | Status |
|---|---|---|---|
| 1 | Xcode CLT | `xcode-select --install` | ☐ |
| 2 | Homebrew | `brew install` | ☐ |
| 3 | zsh + Oh-My-Zsh | `brew install zsh`, install script | ☐ |
| 4 | Shell plugins | git clone autosuggestions, syntax-highlighting | ☐ |
| 5 | Symlink `.zshrc` | `ln -sf console/shell/zsh/.zshrc ~/.zshrc` | ☐ |
| 6 | Symlink `.inputrc` | `ln -sf console/shell/.inputrc ~/.inputrc` | ☐ |
| 7 | Symlink `.bashrc` | `ln -sf console/shell/bash/.bashrc ~/.bashrc` | ☐ |
| 8 | Powerline fonts | git clone fonts + install.sh | ☐ |
| 9 | iTerm2 | Import `iterm2-full-config/Settings.json` via GUI | ☐ |
| 10 | uv | `brew install uv`, `uv python install 3.14`, `uv python pin --global 3.14` | ☐ |
| 11 | Neovim | `brew install neovim`, symlink, `:call dein#install()` | ☐ |
| 12 | Vim | `brew install vim`, symlink `vimrc` + `vim/` | ☐ |
| 13 | Vundle | `:BundleInstall` or command-line install | ☐ |
| 14 | Ansible | `brew install ansible`, symlink config, create `~/.vault_pass` | ☐ |
| 15 | Golang | `mkdir -p ~/.go` | ☐ |
| 16 | Git | `ln -sf console/git/gitconfig ~/.gitconfig` | ☐ |
| 17 | SSH keys | Create/copy keys, add to agent | ☐ |

---

## Quick Setup Script

For quick re-setup, everything can be assembled into a single script:

```bash
#!/bin/bash
set -e

# 1-2. Xcode + Homebrew
xcode-select --install
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew update

# 3-4. zsh + Oh-My-Zsh + plugins
brew install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

# 5-6. Symlinks + fonts
ln -sf $(pwd)/console/shell/zsh/.zshrc ~/.zshrc
ln -sf $(pwd)/console/shell/.inputrc ~/.inputrc
ln -sf $(pwd)/console/shell/bash/.bashrc ~/.bashrc

git clone https://github.com/powerline/fonts.git --depth=1
cd fonts && ./install.sh && cd .. && rm -rf fonts

# 8. uv
brew install uv
uv python install 3.14
uv python pin --global 3.14

# 9. Neovim
brew install neovim
ln -sf $(pwd)/console/neovim ~/.config/nvim

# 10-11. Vim + Vundle
brew install vim
ln -sf $(pwd)/console/vim/.vimrc ~/.vimrc
ln -sf $(pwd)/console/vim ~/.vim

# 12. Ansible
brew install ansible
mkdir -p ~/.ansible
ln -sf $(pwd)/console/ansible/ansible.cfg ~/.ansible/ansible.cfg

# 13. Golang
mkdir -p ~/.go

# 14. Git
ln -sf $(pwd)/console/git/gitconfig ~/.gitconfig

echo "Done! Restart terminal."
```
