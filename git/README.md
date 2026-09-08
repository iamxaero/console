# Git Configuration

> Full Git configuration for DevOps engineer with ~60 aliases.

---

## Installation

```bash
# Symlink
ln -sf $(pwd)/console/git/gitconfig ~/.gitconfig
```

---

## Key Settings

- `core.editor`: `nvim`
- `pull.rebase`: `true`
- `push.default`: `current`
- `push.followTags`: `true`
- `merge.ff`: `no-ff`
- `user.signingkey`: `~/.ssh/id_ed25519`
- `credential.helper`: `cache --timeout=3600`

---

## Aliases (~60 total)

### Main

| Alias | Command |
|---|---|
| `st` | `status` |
| `lg` | `log --graph --oneline --decorate --all` |
| `lga` | `log --graph --oneline --decorate --all --pretty=format:"%h %ad %s (%an)" --date=short` |
| `s` | `status --short` |
| `ss` | `status --short --branch --show-stash` |
| `co` | `checkout` |
| `coo` | `checkout -B` |
| `br` | `branch` |
| `brd` | `branch --delete` |
| `brv` | `branch -v` |
| `brt` | `branch -a` |
| `cm` | `commit --message` |
| `cam` | `commit --all --message` |
| `ca` | `commit --all` |
| `cma` | `commit --amend --no-edit` |
| `cfa` | `commit --fixup` |
| `cs` | `commit --show-signature` |

### Pull/Push

| Alias | Command |
|---|---|
| `gp` | `pull` |
| `gpl` | `pull --rebase --autostash` |
| `gl` | `push` |
| `gf` | `push --force-with-lease` |
| `gpf` | `push --force-with-lease --tags` |

### Merge/Rebase

| Alias | Command |
|---|---|
| `gm` | `merge --no-ff` |
| `gma` | `merge --abort` |
| `gmc` | `merge --continue` |
| `gr` | `rebase` |
| `gra` | `rebase --abort` |
| `grc` | `rebase --continue` |
| `grs` | `rebase --skip` |
| `gsr` | `rebase --onto` |

### Stash

| Alias | Command |
|---|---|
| `gst` | `stash` |
| `gsta` | `stash apply` |
| `gstp` | `stash pop` |
| `gstd` | `stash drop` |
| `gstl` | `stash list` |
| `gsts` | `stash save` |
| `gstu` | `stash push -u` |

### Search/Diff

| Alias | Command |
|---|---|
| `grep` | `log -G` |
| `d` | `diff` |
| `dc` | `diff --cached` |
| `da` | `diff --staged` |
| `dw` | `diff --word-diff` |

### Worktree

| Alias | Command |
|---|---|
| `w` | `worktree` |
| `wa` | `worktree add` |
| `wl` | `worktree list` |
| `wr` | `worktree remove` |

---

## Dependencies

| Dependency | Purpose |
|---|---|
| SSH key | For signing commits and push/pull |
| gpg (optional) | For signed commits |

---

## Troubleshooting

### Aliases not working

```bash
# Make sure gitconfig is symlinked
ls -la ~/.gitconfig
# If not — recreate the link
ln -sf $(pwd)/console/git/gitconfig ~/.gitconfig
```

### Rebase not working

```bash
# Check settings
git config --get pull.rebase
# Should be: true
```
