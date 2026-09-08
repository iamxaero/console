# Zsh Configuration

> Zsh config with Oh-My-Zsh, 23 plugins, and DevOps settings.

---

## Installation

```bash
# Install Oh-My-Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Clone plugins (if not installed)
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

# Symlink
ln -sf $(pwd)/console/shell/zsh/.zshrc ~/.zshrc
```

---

## Key Settings

- Theme: `agnoster` (Powerline)
- ZSH_DISABLE_COMPFIX: `true`
- Locale: `en_US.UTF-8`
- GOPATH: `~/.go`

### Plugins (23 total)

aws, golang, git, gitfast, macos, command-not-found, zsh-autosuggestions, zsh-syntax-highlighting, zsh-colorize, history-substring-search, helm, iterm2, kubectl, jsontools, ansible, github, sudo, terraform, thefuck, docker, docker-compose, zsh-interactive-cd, zsh-navigation-tools, uv

### Python aliases

```bash
alias python="uv run python"
alias python3="uv run python"
alias pip="uv run python -m pip"
alias pip3="uv run python -m pip"
```

---

## Dependencies

| Dependency | Command |
|---|---|
| Powerline fonts | `git clone https://github.com/powerline/fonts.git --depth=1 && cd fonts && ./install.sh` |
| uv | `brew install uv` |
| oh-my-zsh | see Installation above |

---

## Troubleshooting

### agnoster theme not showing icons

```bash
# Install Powerline fonts
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts && ./install.sh && cd .. && rm -rf fonts
```

### uv not working

```bash
# If pyenv is needed (old way):
# Uncomment the pyenv section in .bashrc
brew install pyenv-virtualenv
```
