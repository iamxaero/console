# Shell Configuration

> Common settings for bash and zsh. Includes Oh-My-Zsh plugins, shell plugins, and common environment variables.

---

## Structure

```
shell/
├── README.md              # ← This file
├── .inputrc               # Readline config (bash, python REPL, etc.)
├── bash/
│   ├── README.md          # Bash-specific setup
│   └── .bashrc
└── zsh/
    ├── README.md          # Zsh-specific setup
    └── .zshrc
```

---

## Quick Start

```bash
# Symlink configs
ln -sf $(pwd)/console/shell/zsh/.zshrc ~/.zshrc
ln -sf $(pwd)/console/shell/bash/.bashrc ~/.bashrc
ln -sf $(pwd)/console/shell/.inputrc ~/.inputrc

# Install dependencies (see shell/zsh/README.md)
```

---

## Dependencies

| Dependency | Purpose |
|---|---|
| Powerline fonts | Icons in agnoster theme |
| Oh-My-Zsh | zsh framework |
| zsh-autosuggestions | Command suggestions |
| zsh-syntax-highlighting | Syntax highlighting |
| uv (or pyenv) | Python managers |
| powerline-shell | Powerline prompt for bash |

---

## Troubleshooting

### agnoster theme not showing icons

```bash
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts && ./install.sh && cd .. && rm -rf fonts
```

### uv not working

```bash
# If old pyenv is needed:
# Uncomment the pyenv section in .bashrc
brew install pyenv-virtualenv
```
