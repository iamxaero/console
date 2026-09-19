---

name: console
description: >
Manage the user's DevOps and developer-tool configuration repository.
Use when adding, editing, installing, linking, or troubleshooting configurations
for shell, Neovim, Vim, Ansible, Git, iTerm2, Zed, Claude Code, or other apps.
------------------------------------------------------------------------------

# Console Configuration Workflow

Manage application configurations with a repository-first, single-source-of-truth workflow.

## 1. Core principles

1. **Repository first** — configuration files are maintained in the `console` repository.
2. **Single source of truth** — do not maintain duplicate copies of the same configuration.
3. **Symlinks over copies** — when an application supports filesystem-based configuration, link the machine configuration to the repository.
4. **App-oriented structure** — each application has its own directory directly under `console/`.
5. **Document reproducibility** — each application should have enough documentation to reproduce its setup on a new machine.
6. **Protect existing state** — never overwrite a real machine configuration without inspecting it first.

## 2. Repository structure

Expected repository:

```text
~/github/console/
├── README.md
├── <app>/
│   ├── README.md
│   └── <config files>
└── ...
```

Examples:

```text
console/
├── shell/
├── neovim/
├── vim/
├── ansible/
├── git/
├── iterm2/
├── zed/
├── claude/
└── yadr/
```

Use the actual repository structure as the source of truth. Do not assume an app directory exists.

## 3. Working directory

The console repository is normally:

```text
~/github/console
```

Before modifying repository files:

* use the correct working directory explicitly;
* prefer the tool's `cwd`/working-directory parameter when available;
* otherwise use an explicit `cd`;
* do not rely on the shell's current directory.

For machine-level commands, distinguish clearly between:

```text
repository state
    ~/github/console/...

machine state
    ~/.config/...
    ~/.<file>
```

Never confuse the two.

## 4. Existing configuration

Before installing or linking a configuration:

1. Inspect the destination.
2. Determine whether it is:

   * absent;
   * already a symlink;
   * a symlink to the expected repository file;
   * a symlink to another location;
   * a real file or directory.
3. Never overwrite a real configuration without inspecting it.
4. Preserve or back up user configuration when necessary.
5. Prefer making the repository the source of truth.

If the existing machine configuration contains changes not present in the repository, compare them before replacing it.

## 5. Symlinks

Use symlinks whenever the application supports them.

Example:

```bash
ln -sf "$HOME/github/console/<app>/<config>" "<destination>"
```

Verify the resulting link:

```bash
readlink "<destination>"
```

For directory-based configurations:

```bash
ln -sfn "$HOME/github/console/<app>/<directory>" "<destination>"
```

Do not blindly remove destination directories. Inspect them first.

## 6. Adding a new application

1. Create `console/<app>/`.
2. Add the required configuration files.
3. Create `console/<app>/README.md`.
4. Document prerequisites and setup.
5. Add the application to the root `README.md`.
6. Create the required symlink or documented application integration.
7. Verify the application reads the repository configuration.

Do not add an app-specific directory deeper than necessary unless the application requires it.

## 7. Editing an existing configuration

1. Read `console/<app>/README.md` when it exists.
2. Inspect the relevant configuration.
3. Identify dependencies and references.
4. Modify the repository configuration.
5. Validate the configuration.
6. Verify the machine symlink still points to the repository.
7. Update documentation when behavior, parameters, prerequisites, or setup changed.
8. Update the root `README.md` only when the application inventory or its documented high-level behavior changed.

Do not update documentation merely because an internal formatting or implementation detail changed.

## 8. Installing on a new machine

1. Read the root `README.md`.
2. Identify the application.
3. Read `console/<app>/README.md`.
4. Check prerequisites and installed versions.
5. Install missing dependencies.
6. Inspect existing machine configuration.
7. Create symlinks or perform the documented application-specific integration.
8. Start/reload the application.
9. Verify the configuration is actually being used.

Do not assume that creating a symlink proves the application loaded the configuration.

## 9. Application-specific integrations

Not every application uses a simple symlink.

Examples:

* iTerm2 may require GUI import or application-specific settings.
* Some applications use directories rather than individual files.
* Some applications may generate or modify configuration automatically.

Follow the application's documented integration method when a symlink is not appropriate.

Do not force the symlink model when it conflicts with the application's configuration mechanism.

## 10. README requirements

Each maintained application should have:

* **Overview**
* **Prerequisites**
* **Installation / Environment Setup**
* **Configuration**
* **Integration or Symlinks**
* **Verification**
* **Troubleshooting**
* **Rollback**

Keep documentation executable: commands should be usable on a fresh machine after prerequisites are satisfied.

Avoid documenting information that is already obvious from the configuration unless it is important for setup or troubleshooting.

## 11. Rollback

Before destructive configuration changes:

1. Identify the current destination and its type.
2. Preserve the previous configuration when it contains user changes.
3. Remove only the repository integration being changed.
4. Restore the previous state when required.
5. Verify the application configuration afterward.

Never use a generic `rm` command against an unknown configuration path.

## 12. Validation

Verification should match the application.

Examples:

```text
Shell       → start a clean shell / syntax check
Git         → git config --list / targeted validation
Neovim      → start Neovim and check configuration
Claude Code → validate settings JSON
Zed         → validate JSON and launch/check settings
Ansible     → ansible-config dump / syntax validation
iTerm2      → verify imported settings
```

Use the smallest meaningful verification.

Do not claim a configuration works merely because a file exists or a symlink was created.

## 13. Context discipline

* Read only the relevant app configuration.
* Do not dump entire configuration directories into context.
* Use targeted searches for large files.
* Do not repeatedly read unchanged README/configuration.
* Prefer focused validation commands.
* Avoid unnecessary installation or diagnostic commands.
* Keep command output small.

## 14. Safety

* Never commit secrets, tokens, credentials, private keys, or machine-specific sensitive data.
* Inspect unknown files before deleting or replacing them.
* Do not silently modify unrelated applications.
* Do not upgrade dependencies or applications unless requested or required.
* Do not change machine-level configuration when the task only requires repository changes.
* For destructive or potentially irreversible operations, verify the target first.

## 15. Quick reference

| App         | Repository directory | Typical integration           |
| ----------- | -------------------- | ----------------------------- |
| Shell       | `shell/`             | `~/.zshrc`, `~/.bashrc`       |
| iTerm2      | `iterm2/`            | GUI/settings integration      |
| Neovim      | `neovim/`            | `~/.config/nvim`              |
| Vim         | `vim/`               | `~/.vimrc`, `~/.vim/`         |
| Ansible     | `ansible/`           | `~/.ansible/ansible.cfg`      |
| Git         | `git/`               | `~/.gitconfig`                |
| Zed         | `zed/`               | `~/.config/zed/settings.json` |
| Claude Code | `claude/`            | `~/.claude/settings.json`     |
| YADR        | `yadr/`              | legacy dotfiles               |

Treat this table as a convenience reference; verify actual paths in the application README before making changes.
