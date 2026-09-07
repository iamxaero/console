# Console — DevOps Environment Setup

> Полный гайд по настройке окружения DevOps-инженера. Все шаги задокументированы для автоматизации.

> **Внимание:** Этот проект не содержит персональных данных. При настройке на новой машине замени плейсхолдеры (email, имя) на свои значения.

---

## Содержание

1. [Предварительные требования](#1-предварительные-требования)
2. [Homebrew](#2-homebrew)
3. [Shell (zsh + Oh-My-Zsh)](#3-shell-zsh--oh-my-zsh)
4. [Shell plugins](#4-shell-plugins)
5. [Symlink конфигов](#5-symlink-конфигов)
6. [Powerline fonts](#6-powerline-fonts)
7. [iTerm2](#7-iterm2)
8. [Python (uv)](#8-python-uv)
9. [Neovim](#9-neovim)
10. [Classic Vim (legacy)](#10-classic-vim-legacy)
11. [Ansible](#11-ansible)
12. [Golang](#12-golang)
13. [SSH](#13-ssh)
14. [Git](#14-git)
15. [Summary — чеклист](#summary---чеклист)

> **Подсказка:** Подробнее по каждому приложению читай в его директории:
> - [Shell](shell/README.md)
> - [iTerm2](iterm2/README.md)
> - [Neovim](neovim/README.md)
> - [Vim](vim/README.md)
> - [Ansible](ansible/README.md)
> - [Git](git/README.md)

---

## 1. Предварительные требования

- macOS (судя по путям `/opt/homebrew`, нужен Apple Silicon / M-series)
- Xcode Command Line Tools

```bash
xcode-select --install
```

## 2. Homebrew

Установка Homebrew (если ещё не установлен):

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Обновление:

```bash
brew update
```

## 3. Shell (zsh + Oh-My-Zsh)

### Установка zsh

```bash
brew install zsh
# Добавить в список логин-шеллов
sudo sh -c 'echo $(which zsh) >> /etc/shells'
chsh -s $(which zsh)
```

### Установка Oh-My-Zsh

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
```

### Конфигурация

Смотри: [shell/zsh/README.md](shell/zsh/README.md)

#### Ключевые настройки в `.zshrc`:

| Параметр | Значение |
|---|---|
| Theme | `agnoster` |
| ZSH_DISABLE_COMPFIX | `true` |
| Plugins | aws, golang, git, gitfast, macos, command-not-found, zsh-autosuggestions, zsh-syntax-highlighting, zsh-colorize, history-substring-search, helm, iterm2, kubectl, jsontools, ansible, github, sudo, terraform, thefuck, docker, docker-compose, zsh-interactive-cd, zsh-navigation-tools, uv |
| PATH | `$HOME/.local/bin`, `/usr/local/bin`, `/usr/local/sbin`, `/opt/homebrew/bin`, `/opt/local/bin`, `/opt/local/sbin`, `$HOME/bin` |
| Locale | `en_US.UTF-8` |

#### Python / uv aliases:

```bash
alias python="uv run python"
alias python3="uv run python"
alias pip="uv run python -m pip"
alias pip3="uv run python -m pip"
```

> **Примечание:** pyenv закомментирован — используется uv вместо pyenv.

#### SSH setup:

```bash
eval "$(ssh-agent)" >/dev/null
# Добавь свои ключи
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

## 5. Symlink конфигов

```bash
# Readline config (bash, python REPL и др.)
ln -sf $(pwd)/console/shell/.inputrc ~/.inputrc

# Bash (если используется)
ln -sf $(pwd)/console/shell/bash/.bashrc ~/.bashrc
```

### `.inputrc`

```
"E[A": history-search-backward
"E[B": history-search-forward
```

> Ищет из истории при нажатии ↑/↓ — очень удобно для команд с префиксом.

## 6. Powerline fonts

```bash
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
cd ..
rm -rf fonts
```

> Эти fonts нужны для корректного отображения иконок в теме `agnoster` (powerlevel9k/agnoster использует special glyphs).

## 7. iTerm2

### Полный конфиг

Смотри: [iterm2/README.md](iterm2/README.md)

### Установка

Импорт `iterm2-full-config/Settings.json` через GUI iTerm2:
- iTerm2 → Settings → General → перетащи Settings.json
- **Import...** → выбери файл

### Обновление конфига

Когда вносишь изменения в iTerm2 — экспортируй:

```bash
defaults read ~/Library/Preferences/com.googlecode.iterm2 \
  > console/iterm2/iterm2-full-config/Settings.json
```

## 8. Python (uv)

uv — быстрый менеджер Python-версий и виртуальных окружений (альтернатива pyenv).

```bash
# Установка
brew install uv

# Проверить доступные версии
uv python list

# Установить нужную версию
uv python install 3.14

# Установить как глобальную по умолчанию
uv python pin --global 3.14
```

> **pyenv** в `.bashrc` закомментирован. Если нужно — раскомментировать секцию `Remove pyenv (UV лучше)`.

## 9. Neovim

### Установка

```bash
brew install neovim
```

### Symlink конфига

```bash
ln -sf $(pwd)/console/neovim ~/.config/nvim
```

### Архитектура Neovim конфига

```
~/.config/nvim/
├── init.vim          # Главный конфиг, загружает plugins.vim и settings.vim
├── plugins.vim       # dein.vim plugin manager: загружает dein и все plugin/*.vim
├── settings.vim      # Динамически загружает все settings/*.vim
├── dein/             # dein.vim (plugin manager, клонируется автоматически)
├── thex/             # Локальный плагин (autoload)
├── plugins/          # Определяют все зависимости через dein#add()
│   ├── base.vim      # unite, vimfiler, vimshell, deoplete, vimproc, tpope/*, session, etc.
│   ├── languages.vim # syntastic, polyglot, markdown, javascript, rust, go, hcl, etc.
│   ├── git.vim       # gitv, gist, fugitive, git, gitgutter
│   ├── appearance.vim# colorizer, solarized, lightline
│   ├── search.vim    # sneak, ag, easymotion, greplace, etc.
│   ├── textobjects.vim# kana/*, textobj-* family, indent-guides
│   └── vim-improvements.vim # splitjoin, delimitMate, multiple-cursors, etc.
├── settings/         # Конфиги плагинов
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
    └── kite/         #kite autocomplete (опционально)
```

### Ключевые плагины Neovim (dein.vim):

| Категория | Плагины |
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

### Установка плагинов

```bash
# Открыть Neovim
nvim

# Затем внутри vim выполнить:
# :call dein#install()
```

> dein.vim сам клонирует все зависимости из `plugins/*.vim` при первом запуске.

## 10. Classic Vim (legacy)

### Установка Vim

```bash
brew install vim
```

### Symlink

```bash
# Основной конфиг
ln -sf $(pwd)/console/vim/.vimrc ~/.vimrc

# Bundle-директория (Vundle)
ln -sf $(pwd)/console/vim ~/.vim
```

### Vundle плагины (`~/.vim/vundles.vim`)

| Файл | Категория |
|---|---|
| ruby.vundle | Ruby плагины |
| languages.vundle | Языковые пакеты |
| git.vundle | Git инструменты |
| appearance.vundle | Цвета и UI |
| textobjects.vundle | Text objects |
| search.vundle | Поиск |
| project.vundle | Проекты |
| vim-improvements.vundle | Улучшения Vim |

### Установка плагинов Vundle

```bash
vim --noplugin -u ~/.vim/vundles.vim -N "+set hidden" "+syntax on" +BundleClean! +BundleInstall +qall
```

## 11. Ansible

### Установка

```bash
brew install ansible
```

### Конфигурация

```bash
# Ansible config
mkdir -p ~/.ansible
ln -sf $(pwd)/console/ansible/ansible.cfg ~/.ansible/ansible.cfg

# Vault password (НЕ коммить этот файл!)
openssl rand -base64 32 > ~/.vault_pass
chmod 600 ~/.vault_pass
```

### Ключевые настройки `ansible.cfg`:

| Параметр | Значение |
|---|---|
| `nocows` | 1 |
| `gathering` | smart |
| `fact_caching_timeout` | 7200 |
| `retry_files_enabled` | False |
| `forks` | 20 |
| `timeout` | 60 |
| `transport` | ssh |
| `pipelining` | True |
| `vault_password_file` | `~/.vault_pass` (создать вручную) |
| `inventory` | `inventory` (относительно ~/.ansible) |
| `library` | `library/modules` |
| `roles_path` | `roles/vendor` |
| `ssh_args` | `-C -o ControlMaster=auto -o ControlPersist=60s -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no` |

### Environment variables (из .zshrc):

```bash
export ANSIBLE_VAULT_PASSWORD_FILE=~/.vault_pass
export ANSIBLE_LOG_PATH=~/.ansible/ansible.log
export ANSIBLE_STDOUT_CALLBACK='yaml'
export ANSIBLE_STRATEGY_PLUGINS=~/.ansible/plugins/mitogen
export ANSIBLE_CONFIG=~/.ansible/ansible.cfg
```

> **Важно:** Mitogen strategy plugins нужны — но путь `~/.ansible/plugins/mitogen` должен указывать на установленный mitogen.

## 12. Golang

```bash
# Создать GOPATH
mkdir -p ~/.go
```

> GOPATH установлен в `~/.go` (конфигурация в `.zshrc`).

## 14. Git

### Установка конфига

```bash
# Symlink
ln -sf $(pwd)/console/git/gitconfig ~/.gitconfig
```

### Ключевые настройки `.gitconfig`:

| Параметр | Значение |
|---|---|
| `core.editor` | `nvim` |
| `pull.rebase` | `true` |
| `push.default` | `current` |
| `push.followTags` | `true` |
| `merge.ff` | `no-ff` |
| `user.signingkey` | `~/.ssh/id_ed25519` |
| `credential.helper` | `cache --timeout=3600` |

### Aliases

~60 алиасов: `st`, `lg`, `gco`, `gcob`, `gs`, `gp`, `gpr`, `gr`, `gst`, `gaa`, `gm`, `gpf`, `w` (worktree), и др.

> **Примечание:** `.gitconfig` — полный конфиг DevOps-инженера. Email/name/ключи нужно адаптировать под себя.

## 15. SSH

### Ключи

В `.zshrc` настроена попытка добавить ключи:

1. `~/.ssh/id_ed25519` (приоритет)
2. `~/.ssh/id_rsa` (fallback)

**Что нужно сделать вручную:**

```bash
# Скопировать/создать SSH ключи
# 1. Либо создать новый:
ssh-keygen -t ed25519 -C "devops@example.com"

# 2. Либо скопировать существующие из бэкапа
# Добавить публичный ключ в GitHub, GitLab и т.д.
```

## Summary — чеклист

| # | Шаг | Команда | Статус |
|---|---|---|---|
| 1 | Xcode CLT | `xcode-select --install` | ☐ |
| 2 | Homebrew | `brew install` | ☐ |
| 3 | zsh + Oh-My-Zsh | `brew install zsh`, install script | ☐ |
| 4 | Shell plugins | git clone autosuggestions, syntax-highlighting | ☐ |
| 5 | Symlink `.zshrc` | `ln -sf console/shell/zsh/.zshrc ~/.zshrc` | ☐ |
| 6 | Symlink `.inputrc` | `ln -sf console/shell/.inputrc ~/.inputrc` | ☐ |
| 7 | Symlink `.bashrc` | `ln -sf console/shell/bash/.bashrc ~/.bashrc` | ☐ |
| 8 | Powerline fonts | git clone fonts + install.sh | ☐ |
| 9 | iTerm2 | Импорт `iterm2-full-config/Settings.json` через GUI | ☐ |
| 10 | uv | `brew install uv`, `uv python install 3.14`, `uv python pin --global 3.14` | ☐ |
| 11 | Neovim | `brew install neovim`, symlink, `:call dein#install()` | ☐ |
| 12 | Vim | `brew install vim`, symlink `vimrc` + `vim/` | ☐ |
| 13 | Vundle | `:BundleInstall` или command-line install | ☐ |
| 14 | Ansible | `brew install ansible`, symlink config, create `~/.vault_pass` | ☐ |
| 15 | Golang | `mkdir -p ~/.go` | ☐ |
| 16 | Git | `ln -sf console/git/gitconfig ~/.gitconfig` | ☐ |
| 17 | SSH keys | Create/copy keys, add to agent | ☐ |

---

## Quick Setup Script

Для быстрой повторной настройки можно собрать всё в один скрипт:

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
