# Zsh Configuration

> Zsh конфиг с Oh-My-Zsh, 23 плагинами и настройками для DevOps.

---

## Установка

```bash
# Установи Oh-My-Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Clone plugins (если не установлено)
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

# Symlink
ln -sf $(pwd)/console/shell/zsh/.zshrc ~/.zshrc
```

---

## Ключевые настройки

- Theme: `agnoster` (Powerline)
- ZSH_DISABLE_COMPFIX: `true`
- Locale: `en_US.UTF-8`
- GOPATH: `~/.go`

### Плагины (23 шт)

aws, golang, git, gitfast, macos, command-not-found, zsh-autosuggestions, zsh-syntax-highlighting, zsh-colorize, history-substring-search, helm, iterm2, kubectl, jsontools, ansible, github, sudo, terraform, thefuck, docker, docker-compose, zsh-interactive-cd, zsh-navigation-tools, uv

### Python aliases

```bash
alias python="uv run python"
alias python3="uv run python"
alias pip="uv run python -m pip"
alias pip3="uv run python -m pip"
```

---

## Зависимости

| Зависимость | Команда |
|---|---|
| Powerline fonts | `git clone https://github.com/powerline/fonts.git --depth=1 && cd fonts && ./install.sh` |
| uv | `brew install uv` |
| oh-my-zsh | см. Установка выше |

---

## Troubleshooting

### Theme agnoster не показывает иконки

```bash
# Установи Powerline fonts
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts && ./install.sh && cd .. && rm -rf fonts
```

### uv не работает

```bash
# Если pyenv нужен (старый способ):
# Раскомментируй секцию pyenv в .bashrc
brew install pyenv-virtualenv
```
