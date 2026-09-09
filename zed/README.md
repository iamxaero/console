# Zed Editor

> Современный высокоскоростной текстовый редактор от создателей Atom. AI-first редактор с встроенным агентом.

## Overview

Zed — высокоскоростной редактор с встроенной AI-интеграцией (агент, Edit Predictions),
поддержкой кастомных моделей (Ollama, OpenAI-compatible), агентами (Hermes Agent)
и полной настройкой через JSON-конфиги.

**Конфиги хранятся в проекте** `console/zed/`, на машине — симлинк на `~/.config/zed/settings.json`.
Это единый источник правды — все изменения делаются в проекте, симлинк обновляется автоматически.

---

## Prerequisites

- **macOS** (Zed поддерживает только macOS)
- **Homebrew** — для установки

```bash
# Установить Homebrew, если нет
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Обновить
brew update
```

---

## Installation

### Шаг 1: Установить Zed

```bash
brew install --cask zed
```

### Шаг 2: Установить Ollama (для Edit Predictions и локальных моделей)

```bash
brew install ollama

# Запустить Ollama (создаёт фоновый сервис)
ollama serve &

# Или установить как сервис (запускается при старте)
brew services start ollama

# Скачать модели
ollama pull qwen3.5:9b-mlx
```

### Шаг 3: Установить Hermes Agent (для кастомного агента)

```bash
# Установить hermes-acp (требуется бинарный файл)
# Путь и способ установки зависит от вашего окружения
# Убедитесь, что бинарник доступен в PATH
which hermes-acp
```

### Шаг 4: Установить расширения

Через Zed UI (`Cmd+Shift+P` → "Extensions"):

| Расширение | Назначение |
|---|---|
| `git-firefly` | Git-интеграция |
| `html` | Поддержка HTML |
| `material-icon-theme` | Иконки Material Design |

Или через терминал:

```bash
# Zed не поддерживает установку расширений из CLI,
# устанавливайте через UI: Cmd+Shift+P → "Extensions"
```

### Шаг 5: Подключить конфиг из проекта

```bash
# Перейти в проект (если ещё не там)
cd ~/github/console

# Удалить существующий конфиг (если есть)
rm -f ~/.config/zed/settings.json

# Создать симлинк на проект
ln -sf $(pwd)/console/zed/settings.json ~/.config/zed/settings.json

# Проверить
ls -la ~/.config/zed/settings.json
```

### Шаг 6: Перезапустить Zed

Zed автоматически подхватит новый конфиг через симлинк.

---

## Configuration

### Файлы в проекте

| Файл | Описание |
|---|---|
| `settings.json` | Все пользовательские настройки |

### AI-модели

| Провайдер | Тип | URL | Модель |
|---|---|---|---|
| **FreeToken** | openai_compatible | `http://192.168.0.77:1919/v1` | `Qwen3.6-35B-A3B-FP8` (131k токенов) |
| **Ollama** | ollama | `http://localhost:11434` | `qwen3.5:9b-mlx` |

### Агент по умолчанию

- **Провайдер**: `FreeToken`
- **Модель**: `Qwen3.6-35B-A3B-FP8`
- **Макс. токенов**: 131072

### Избранные модели

| Провайдер | Модель | Thinking |
|---|---|---|
| `ollama` | `qwen3.6:27b-q4_K_M` | ✅ включено |
| `FreeToken` | `Qwen3.6-35B-A3B-FP8` | ✅ включено |

### Edit Predictions

- **Провайдер**: `ollama`
- **URL**: `http://localhost:11434`

### Hermes Agent

- **Команда**: `hermes-acp`
- **Тип**: кастомный сервер агента

### Основные настройки

| Параметр | Значение |
|---|---|
| Тема | `Gruvbox Dark` |
| Тема иконок | `Material Icon Theme` |
| Размер шрифта UI | 16 |
| Размер шрифта буфера | 15 |
| Авто-сохранение | `on_focus_change` |
| Оболочка терминала | `/bin/zsh` |
| Клавиатурный мап | `Zed` |
| Док агента | справа |
| Телеметрия | отключена |

### Права доступа агента

| Инструмент | По умолчанию |
|---|---|
| `skill` | allow |
| `search_web` | allow |
| `fetch` | allow |
| `edit_file` | allow |
| `terminal` | allow |
| `move_path` | allow |
| `create_directory` | confirm |
| `copy_path` | confirm |
| `delete_path` | confirm |
| `write_file` | confirm |

---

## Troubleshooting

| Проблема | Решение |
|---|---|
| AI не отвечает | Проверьте Ollama: `curl http://localhost:11434/api/tags` |
| Edit Predictions не работают | Убедитесь, что Ollama запущен и модель скачана |
| FreeToken не отвечает | Проверьте доступ к `http://192.168.0.77:1919/v1` (локальная сеть) |
| Hermes Agent не найден | `which hermes-acp` — должен вернуть путь |
| Конфиг не подхватился | Перезапустите Zed полностью (`Cmd+Q`, затем откройте`) |
| Симлинк сломался | `ls -la ~/.config/zed/settings.json` — должен вести на проект |

---

## Rollback

```bash
# Удалить симлинк
rm ~/.config/zed/settings.json

# Создать временный конфиг для проверки
echo '{}' > ~/.config/zed/settings.json
```

## Custom Prompts

Кастомные промпты хранятся в `~/.config/zed/prompts/` как MDB-база данных.
Не выгружаются в проект — это локальные данные пользователя.

## Full Setup Script

Для быстрой настройки на новой машине:

```bash
#!/bin/bash
set -e

# 1. Zed
brew install --cask zed

# 2. Ollama
brew install ollama
ollama serve &
ollama pull qwen3.5:9b-mlx

# 3. Подключить конфиг из проекта
CONSOLE_DIR="$HOME/github/console"
# Если проект ещё не клонирован:
# git clone https://github.com/iamxaero/console.git ~/github/console

rm -f ~/.config/zed/settings.json
ln -sf "$CONSOLE_DIR/console/zed/settings.json" ~/.config/zed/settings.json

echo "✅ Zed setup complete. Restart Zed."
```
