# Claude Code — DevOps Environment Setup

> Настройка Claude Code (AI assistant) для DevOps-окружения.

## Overview

Claude Code — AI-ассистент для разработки. Конфигурация включает:
- **Hooks** — интеграция с iTerm2 (cc-status) для отображения статуса в терминале
- **Permissions** — granular control над Bash-командами
- **Theme** — автоматическая тема (auto)

## Prerequisites

- Claude Code CLI установлен
- macOS

## Configuration

### File

- `settings.json` — глобальная конфигурация Claude Code (`~/.claude/settings.json`)

### Permissions

| Level | Commands |
|---|---|
| **allow** | `Edit`, `Write` |
| **ask** | `Bash(argocd:*)`, `Bash(docker:*)`, `Bash(flux:*)`, `Bash(gh:*)`, `Bash(git branch:*)`, `Bash(git checkout:*)`, `Bash(git clean:*)`, `Bash(git commit:*)`, `Bash(git merge:*)`, `Bash(git push:*)`, `Bash(git rebase:*)`, `Bash(git reset:*)`, `Bash(git tag:*)`, `Bash(glab:*)`, `Bash(helm:*)`, `Bash(kubectl:*)`, `Bash(mv:*)`, `Bash(op:*)`, `Bash(rm:*)`, `Bash(rmdir:*)`, `Bash(terraform:*)`, `Bash(terragrunt:*)`, `Bash(vault:*)` |
| **deny** | `Bash(git push --force:*)`, `Bash(rm -rf:*)` |

### Hooks

Все hooks используют скрипт `/Users/vk/.config/iterm2/cc-status` для обновления статуса Claude в панели iTerm2.

Event-хуки:
- `Notification` — push-уведомления
- `PermissionRequest` — запросы разрешений
- `PostToolUse` / `PreToolUse` — до/после выполнения инструментов
- `SessionEnd` / `SessionStart` — начало/конец сессии
- `Stop` / `StopFailure` / `SubagentStop` — остановки
- `UserPromptSubmit` — **blocking pre-answer protocol** (см. ниже) + cc-status

### UserPromptSubmit Protocol

Перед каждым ответом Claude Code выполняет:
1. Проверяет скиллы в `~/Documents/git/.agent/skills/` — читает `SKILL.md` если тема совпадает
2. Помечает каждый claim: **verified** (file/line/log) vs **assumption** — никогда не представляет assumption как факт
3. Если это вопрос — отвечает первым, без команд до ответа

## Symlinks

```bash
ln -sf $(pwd)/claude/settings.json ~/.claude/settings.json
```

## Troubleshooting

- **cc-status не работает** — убедитесь, что скрипт существует: `ls -l /Users/vk/.config/iterm2/cc-status`
- **hooks не срабатывают** — проверьте формат JSON: `python3 -m json.tool ~/.claude/settings.json`
