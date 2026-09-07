# iTerm2 Configuration

> Полный экспорт конфига iTerm2 из `~/Library/Preferences/com.googlecode.iterm2.plist`
>
> Формат: Apple Property List (plist-style), не чистый JSON

---

## Структура

```
iterm2/
├── README.md                          # ← Этот файл
├── iterm2-full-config/
│   ├── Settings.json                  # Полный экспорт конфига (60KB)
│   └── README.md                      # Подробный разбор профилей и настроек
└── best theme.json                    # Старый дамп одного профиля (устарел)
```

---

## Обновление конфига

Когда меняешь настройки в iTerm2 — экспортируй снова:

```bash
defaults read ~/Library/Preferences/com.googlecode.iterm2 \
  > console/iterm2/iterm2-full-config/Settings.json
```

### Через GUI iTerm2

1. iTerm2 → Settings → General
2. Перетащи `Settings.json` в окно настроек
3. Или: **File → Import Settings**

---

## Профили (2 шт.)

### 1. Default

Базовый профиль — для новых вкладок.

| Параметр | Значение |
|---|---|
| **Name** | Default |
| **Guid** | `F2610AC3-706C-4C2A-BB20-F284D51E4296` |
| **Шрифт** | Monaco 12 |
| **Колонки / Строки** | 80 / 25 |
| **Scrollback** | 1000 |
| **Option Key Sends** | 0 |
| **Disable Window Resizing** | 1 |
| **Keyboard Map** | (пусто — стандартные) |

### 2. best theme

Основной рабочий профиль — тёмная тема, кастомная палитра, клавиатурные маппинги.

| Параметр | Значение |
|---|---|
| **Name** | best theme |
| **Guid** | `132AB47A-ACD5-4BFD-9100-A0AA285E3AEF` |
| **Default Bookmark** | ✅ (выбран по умолчанию) |
| **Шрифт** | InconsolataForPowerline-dz 12 |
| **Колонки / Строки** | 176 / 40 |
| **Scrollback** | 1000 |
| **Working Directory** | `$HOME` |
| **Transparency** | 0 |
| **Visual Bell** | 1 |
| **Show Status Bar** | 1 |
| **Blinking Cursor** | false |
| **BM Growl** | true |
| **Option Key Sends** | 2 (Meta как Esc) |

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

#### Keyboard Map (best theme)

| Комбинация | Выход |
|---|---|
| `Esc [A` | `0x1b 0x1b 0x5b 0x41` |
| `Esc [B` | `0x1b 0x1b 0x5b 0x42` |
| `Esc [D` | `[D` |
| `Esc [C` | `[C` |
| `Esc [5D` | `[5D` |
| `Esc [5C` | `[5C` |
| `Esc [F` | `[F` |
| `Esc [H` | `[H` |
| `F1` | `[28~` |
| `F2` | `[29~` |
| `F3` | `[26~` |
| `F4` | `[25~` |
| `⌘↑` | `b` |
| `⌘↓` | `f` |
| `⌘←` | `[D` |
| `⌘→` | `[C` |
| `⌘-` | `0x1f` |
| `⌘^` | `0x1e` |
| `⇧F1` | Open Profile (Action 4) |
| `⇧F3` | Create Group (Action 5) |

---

## Глобальные настройки

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

### Оконные фреймы

| Фрейм | Позиция | Размер |
|---|---|---|
| iTerm Main Window | 382, 391 | 1418×738 |
| NSColorPanel | 0, 83 | 250×297 |
| SUUpdateAlert | 590, 559 | 620×402 |
| SUStatusFrame | 700, 756 | 400×139 |

### Системные

| Параметр | Значение |
|---|---|
| macOS | Version 26.6.2 (Build 25G83) |
| Экран | 1800×1169 |
| iTerm2 версии | 3.6.6, 3.6.8, 3.6.9, 3.6.10, 3.6.11 |
| AppleWindowTabbingMode | manual |
| AppleScrollAnimationEnabled | 0 (отключена) |
| ApplePressAndHoldEnabled | 0 |

---

## Заметки

- Файл в формате **Apple Property List** (не чистый JSON)
- `Default Bookmark Guid` ссылается на **"best theme"** — профиль по умолчанию
- `Working Directory` в "best theme" — `$HOME`
- **Powerline fonts** должны быть установлены (см. main README)
- Старый `best theme.json` — устарел, полный конфиг в `iterm2-full-config/Settings.json`
