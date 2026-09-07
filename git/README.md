# Git Configuration

> Полная конфигурация Git для DevOps-инженера с ~60 алиасами.

---

## Установка

```bash
# Symlink
ln -sf $(pwd)/console/git/gitconfig ~/.gitconfig
```

---

## Ключевые настройки

- `core.editor`: `nvim`
- `pull.rebase`: `true`
- `push.default`: `current`
- `push.followTags`: `true`
- `merge.ff`: `no-ff`
- `user.signingkey`: `~/.ssh/id_ed25519`
- `credential.helper`: `cache --timeout=3600`

---

## Алиасы (~60 шт)

### Основные

| Алиас | Команда |
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

| Алиас | Команда |
|---|---|
| `gp` | `pull` |
| `gpl` | `pull --rebase --autostash` |
| `gl` | `push` |
| `gf` | `push --force-with-lease` |
| `gpf` | `push --force-with-lease --tags` |

### Merge/Rebase

| Алиас | Команда |
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

| Алиас | Команда |
|---|---|
| `gst` | `stash` |
| `gsta` | `stash apply` |
| `gstp` | `stash pop` |
| `gstd` | `stash drop` |
| `gstl` | `stash list` |
| `gsts` | `stash save` |
| `gstu` | `stash push -u` |

### Search/Diff

| Алиас | Команда |
|---|---|
| `grep` | `log -G` |
| `d` | `diff` |
| `dc` | `diff --cached` |
| `da` | `diff --staged` |
| `dw` | `diff --word-diff` |

### Worktree

| Алиас | Команда |
|---|---|
| `w` | `worktree` |
| `wa` | `worktree add` |
| `wl` | `worktree list` |
| `wr` | `worktree remove` |

---

## Зависимости

| Зависимость | Зачем |
|---|---|
| SSH ключ | Для signing commits и push/pull |
| gpg (опционально) | Для signed commits |

---

## Troubleshooting

### Алиасы не работают

```bash
# Убедись что gitconfig линкнут
ls -la ~/.gitconfig
# Если нет — пересоздай линк
ln -sf $(pwd)/console/git/gitconfig ~/.gitconfig
```

### Rebase не работает

```bash
# Проверь настройки
git config --get pull.rebase
# Должно быть: true
```
