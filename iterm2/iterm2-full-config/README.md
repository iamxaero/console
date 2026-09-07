# iTerm2 Configuration

> Полный экспорт конфига iTerm2 из `~/Library/Preferences/com.googlecode.iterm2.plist`
>
> Формат: Apple Property List (plist-style), не чистый JSON

---

## Обновление конфига

Когда меняешь настройки в iTerm2 — экспортируй снова:

```bash
# Через defaults (командная строка)
defaults read /Users/vk/Library/Preferences/com.googlecode.iterm2 \
  > console/iterm/iterm2-full-config/Settings.json
```

### Через GUI iTerm2

1. Открой iTerm2
2. iTerm2 → Settings → General
3. Перетащи `Settings.json` в окно настроек
4. Или: **File → Import Settings**

---

## Структура конфига

Файл содержит три основные части:

1. **Глобальные настройки** — AI, оконные фреймы, системные параметры
2. **New Bookmarks** — массив профилей (2 шт.)
3. **NoSync** — системная информация, переменные, метаданные

---

## Глобальные настройки

### Apple-системные

| Параметр | Значение |
|---|---|
| `AppleWindowTabbingMode` | manual |
| `AppleScrollAnimationEnabled` | 0 (отключена) |
| `ApplePressAndHoldEnabled` | 0 |
| `AppleSmoothFixedFontsSizeThreshold` | 1 |
| `AppleAntiAliasingThreshold` | 1 |
| `NSScrollAnimationEnabled` | 0 |
| `NSScrollViewShouldScrollUnderTitlebar` | 0 |

### Оконные фреймы

| Фрейм | Позиция | Размер | Монитор |
|---|---|---|---|
| iTerm Main Window | 382, 391 | 1418×738 | -1 (main) |
| NSColorPanel | 0, 83 | 250×297 | - |
| SUUpdateAlert | 590, 559 | 620×402 | - |
| SUStatusFrame | 700, 756 | 400×139 | - |

### AI (iTerm2 AI)

| Параметр | Значение |
|---|---|
| `AiModel` | gpt-5.5 |
| `AiMaxTokens` | 1050000 |
| `AiResponseMaxTokens` | 128000 |
| `AitermURL` | https://api.openai.com/v1/responses |
| `AITermAPI` | 2 |
| `AIFeatureFunctionCalling` | 1 |
| `AIFeatureHostedCodeInterpeter` | 1 |
| `AIFeatureHostedFileSearch` | 1 |
| `AIFeatureHostedWebSearch` | 1 |
| `AIFeatureStreamingResponses` | 1 |
| `AIVectorStore` | 0 |

---

## Профили (New Bookmarks)

### 1. Default

Базовый профиль — для новых вкладок и окон.

| Параметр | Значение |
|---|---|
| **Name** | Default |
| **Guid** | `F2610AC3-706C-4C2A-BB20-F284D51E4296` |
| **Шрифт** | Monaco 12 |
| **Non-ASCII Font** | Monaco 12 |
| **Колонки / Строки** | 80 / 25 |
| **Scrollback** | 1000 |
| **Terminal Type** | xterm-256color |
| **Mouse Reporting** | 1 |
| **Scrollback Lines** | 1000 |
| **Unlimited Scrollback** | 0 |
| **Option Key Sends** | 0 |
| **Right Option Key Sends** | 0 |
| **Disable Window Resizing** | 1 |
| **Prompt Before Closing 2** | 0 |
| **Close Sessions On End** | 1 |
| **Flashing Bell** | 0 |
| **Silence Bell** | 0 |
| **BM Growl** | 0 |
| **Visual Bell** | 0 |
| **Use Bold Font** | 1 |
| **Use Bright Bold** | 1 |
| **Use Italic Font** | 1 |
| **Custom Directory** | No |
| **Custom Command** | No |
| **Default Bookmark** | No |
| **Description** | Default |
| **Jobs to Ignore** | rlogin, ssh, slogin, telnet |
| **Custom Locale** | en_US.UTF-8 |
| **Keyboard Map** | (пусто — стандартные) |

### 2. best theme

Основной рабочий профиль — тёмная тема, кастомная палитра, клавиатурные маппинги.

| Параметр | Значение |
|---|---|
| **Name** | best theme |
| **Guid** | `132AB47A-ACD5-4BFD-9100-A0AA285E3AEF` |
| **Default Bookmark** | (выбран по умолчанию) |
| **Шрифт** | InconsolataForPowerline-dz 12 |
| **Non-ASCII Font** | Menlo-Regular 11 |
| **Колонки / Строки** | 176 / 40 |
| **Scrollback** | 1000 |
| **Working Directory** | `$HOME` |
| **Terminal Type** | xterm-256color |
| **Mouse Reporting** | 1 |
| **Scrollback Lines** | 1000 |
| **Transparency** | 0 |
| **Disable Window Resizing** | 1 |
| **Visual Bell** | 1 |
| **Show Status Bar** | 1 |
| **Use Bold Font** | 1 |
| **Use Bright Bold** | 1 |
| **Use Italic Font** | 1 |
| **Use Non-ASCII Font** | 0 |
| **Use Tab Color** | 0 |
| **Use Underline Color** | 0 |
| **Blinking Cursor** | false |
| **BM Growl** | true |
| **Send Code When Idle** | false |
| **Sync Title** | 0 |
| **Idle Code** | 0 |
| **Window Type** | 0 |
| **Horizontal Spacing** | 1.01 |
| **Vertical Spacing** | 1 |
| **Screen** | -1 |
| **Shortcut** | (пусто) |

#### Цветовая палитра (best theme)

| Color | Red | Green | Blue | Описание |
|---|---|---|---|---|
| **Background** | 0 | 0.17 | 0.21 | Тёмно-синий |
| **Foreground** | 0.51 | 0.58 | 0.59 | Серо-голубой |
| **Ansi 0** | 0.03 | 0.07 | 0.26 | Тёмный |
| **Ansi 1** | 0.86 | 0.20 | 0.18 | Красный |
| **Ansi 2** | 0.52 | 0.60 | 0 | Зелёный |
| **Ansi 3** | 0.71 | 0.54 | 0 | Жёлтый |
| **Ansi 4** | 0.15 | 0.55 | 0.82 | Синий |
| **Ansi 5** | 0.83 | 0.21 | 0.51 | Маджента |
| **Ansi 6** | 0.16 | 0.63 | 0.60 | Бирюзовый |
| **Ansi 7** | 0.93 | 0.91 | 0.84 | Светло-серый |
| **Ansi 8** | 0.28 | 0.33 | 0.47 | Серый |
| **Ansi 9** | 0.80 | 0.29 | 0.09 | Ярко-красный |
| **Ansi 10** | 0.35 | 0.43 | 0.46 | Серо-зелёный |
| **Ansi 11** | 0.40 | 0.48 | 0.51 | Серо-жёлтый |
| **Ansi 12** | 0.51 | 0.58 | 0.59 | Серо-синий |
| **Ansi 13** | 0.42 | 0.44 | 0.77 | Фиолетовый |
| **Ansi 14** | 0.58 | 0.63 | 0.63 | Бирюзовый светл. |
| **Ansi 15** | 0.99 | 0.96 | 0.89 | Белый |

#### Дополнительные цвета (best theme)

| Цвет | Red | Green | Blue |
|---|---|---|---|
| **Cursor Color** | 0.51 | 0.58 | 0.59 |
| **Cursor Text Color** | 0.03 | 0.07 | 0.26 |
| **Selection Color** | 0.03 | 0.21 | 0.26 |
| **Selected Text Color** | 0.58 | 0.63 | 0.63 |
| **Cursor Guide Color** | 0.70 | 0.93 | 1.0 |
| **Link Color** | 0 | 0.36 | 0.73 |
| **Bold Color** | 0.58 | 0.63 | 0.63 |
| **Badge Color** | 1 | 0.15 | 0 |

#### Keyboard Map (best theme)

Пользовательские клавиатурные маппинги:

| Комбинация | Действие | Выход |
|---|---|---|
| `Esc [A` | Esc Esc Up | `0x1b 0x1b 0x5b 0x41` |
| `Esc [B` | Esc Esc Down | `0x1b 0x1b 0x5b 0x42` |
| `Esc [D` | Left | `[D` |
| `Esc [C` | Right | `[C` |
| `Esc [5D` | Ctrl+Left | `[5D` |
| `Esc [5C` | Ctrl+Right | `[5C` |
| `Esc [F` | End | `[F` |
| `Esc [H` | Home | `[H` |
| `F1` | — | `[28~` |
| `F2` | — | `[29~` |
| `F3` | — | `[26~` |
| `F4` | — | `[25~` |
| `⌘↑` | — | `b` |
| `⌘↓` | — | `f` |
| `⌘←` | — | `[D` |
| `⌘→` | — | `[C` |
| `⌘-` | — | `0x1f` |
| `⌘^` | — | `0x1e` |
| `⇧F1` | Open Profile | Action 4 |
| `⇧F3` | Create Group | Action 5 |

#### Option Key

| Клавиша | Значение |
|---|---|
| `Option Key Sends` | 2 |
| `Right Option Key Sends` | 2 |

Значение `2` означает: отсылать `Meta` (⌥) как Esc.

#### Статус-бар

```
iTermStatusBarJobComponent
  - base: priority: 5
  - base: compression resistance: 1
  - algorithm: 0
  - font: .AppleSystemUIFont 12
```

---

## NoSync (системная информация)

### macOS

| Параметр | Значение |
|---|---|
| **Версия** | Version 26.6.2 (Build 25G83) |
| **Экран** | 1800×1169 |
| **Window Preferences** | topLeft: 507, 928 |
| **Last Root Directory** | `/Users/vk/git` (hex-encoded) |

### iTerm2

| Параметр | Значение |
|---|---|
| **Версии** | 3.6.6, 3.6.8, 3.6.9, 3.6.10, 3.6.11 |
| **Installation ID** | 290E5D56-9D68-4CF3-8F02-3ABF52405CDD |
| **Python Version Requirement** | 1.17 |
| **Launch Experience Run Count** | 39 |
| **Ignore System Window Restoration** | 1 |
| **Permission to Show Tip** | 0 |

### Recorded Variables (32 шт.)

profileName, tmuxRole, lastCommand, hostname, path, shell, selection, processTitle, columns, rows, tmuxWindowPane, tmuxPaneTitle, tmuxStatusLeft, tmuxStatusRight, tmuxWindowPaneIndex, tmuxClientName, triggerName, autoName, badge, username, pid, jobPid, effective_root_pid, sshIntegrationLevel, terminalWindowName, creationTimeString, commandLine, applicationKeypad, tab, tab.tmuxWindowName, tab.tmuxWindowTitle, iterm2, parentSession, isHotkeyWindow, currentTab, currentTab.currentSession.pid, currentTab.currentSession.mouseInfo, currentTab.currentSession.termid, currentTab.currentSession.terminalWindowName, currentTab.currentSession.terminalIconName, currentTab.currentSession.processTitle

---

## Установка на новой машине

### Способ 1: через defaults (полный импорт)

```bash
# Экспортируй текущий (бэкап)
defaults read /Users/vk/Library/Preferences/com.googlecode.iterm2 \
  > ~/iterm2-backup-$(date +%Y%m%d).json

# Импортируй новый
defaults read /path/to/Settings.json > /tmp/iterm2-import.plist

# Сбрось текущий конфиг
defaults delete com.googlecode.iterm2

# Запиши новый
defaults read /tmp/iterm2-import.plist > /tmp/iterm2-final.plist
defaults write com.googlecode.iterm2 < /tmp/iterm2-final.plist

# Перезапусти
killall iTerm2
```

### Способ 2: через GUI

1. Открой iTerm2
2. iTerm2 → Settings → General
3. Перетащи `Settings.json` в окно настроек
4. Перезапусти iTerm2

### Способ 3: импорт профиля (только цвета и настройки)

1. Открой iTerm2 → Settings → Profiles
2. Выбери профиль
3. Импортируй `best theme.json` (старый, только профиль)

---

## Заметки

- Файл в формате **Apple Property List** (не стандартный JSON)
- `Default Bookmark Guid` ссылается на профиль **"best theme"** (GUID: `132AB47A-...`)
- **"best theme"** — профиль по умолчанию, используется при новом окне
- **"Default"** — базовый, без кастомизации
- `Working Directory` установлен на `$HOME` (а не хардкод)
- **AI настроен**: GPT-5.5 через OpenAI API, 1050000 токенов
- **Шрифты**: Monaco (Default), InconsolataForPowerline-dz (best theme)
- **Powerline fonts** должны быть установлены (см. README проекта)
