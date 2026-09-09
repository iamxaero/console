---
name: console
description: >
  Workflow for managing DevOps configs: add, edit, or install app configurations.
  Use when setting up shell, neovim, vim, ansible, git, iterm2, or adding a new app.
---

# Console — AI Workflow

> All skill content is in English.

## 4 Principles

1. **App-first dirs** — create directories named after the app (shell/, neovim/, etc), avoid deep nesting.
2. **Symlinks, not copies** — store configs in `console/`, create `ln -sf` on the machine, one source of truth.
3. **README-driven setup** — every app directory must have a `README.md` with a complete setup guide.
4. **Single source of truth** — one config per file, no duplication.

## Rules

- **Store configs in `console/<app>/`** — never copy files to `~/.config/` or elsewhere
- **Always symlink** — `ln -sf $(pwd)/console/<app>/<config> ~/.<config>`
- **Never duplicate** — one config per file, symlink everywhere it's needed
- **Every app must have README.md** — with setup instructions that work on a fresh system
- **Rollback** — to undo: `rm ~/.<config>` then remove symlink
- **README Always** — when making any config change: read the app's `README.md`, update it if something changed, update root `README.md`

## Adding a new app

1. Create `console/<app>/` directory
2. Create `console/<app>/README.md` (see README.md Structure below)
3. Add config files to `console/<app>/`
4. Update root README.md (apps table)
5. Symlink: `ln -sf $(pwd)/console/<app>/<config> ~/.<config>`

## Editing an existing app config

1. Read `console/<app>/README.md` — understand current setup
2. Read the config files in `console/<app>/`
3. Make changes to the config files
4. Re-read `console/<app>/README.md` — if the config changed, update the README
5. Update root `README.md` if the app's section/parameters changed
6. Symlink updated config: `ln -sf $(pwd)/console/<app>/<config> ~/.<config>`

## README.md Structure

Each app `README.md` must contain:

- **Overview** — what the app is, description
- **Prerequisites** — `brew install ...`, versions
- **Environment Setup** — step-by-step commands, environment variables
- **Configuration** — config files, key parameters, table
- **Symlinks** — which symlinks to create, where they point
- **Troubleshooting** — common issues, how to rollback

## Installing/Configuring local machine

1. Read root `README.md` — overview of all apps
2. Pick the app to install (e.g. `neovim`)
3. Read `console/<app>/README.md` — detailed setup instructions
4. Follow installation steps (brew install, etc.)
5. Create symlinks (see Rules section)
6. Test: restart terminal / open app and verify

## Apps Quick Reference

| App | Dir | Symlink |
|---|---|---|
| Shell | `shell/` | `~/.zshrc`, `~/.bashrc` |
| iTerm2 | `iterm2/` | Settings import via GUI |
| Neovim | `neovim/` | `~/.config/nvim` |
| Vim | `vim/` | `~/.vimrc`, `~/.vim/` |
| Ansible | `ansible/` | `~/.ansible/ansible.cfg` |
| Git | `git/` | `~/.gitconfig` |
| Zed | `zed/` | `~/.config/zed/settings.json` |
| YADR | `yadr/` | legacy dotfiles |
