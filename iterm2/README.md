# iTerm2 Configuration

> Full export of iTerm2 config from `~/Library/Preferences/com.googlecode.iterm2.plist`
>
> Format: Apple Property List (plist-style), not plain JSON

---

## Structure

```
iterm2/
├── README.md                          # ← This file
├── iterm2-full-config/
│   ├── Settings.json                  # Full config export (60KB)
│   └── README.md                      # Detailed breakdown of profiles and settings
└── best theme.json                    # Old dump of a single profile (deprecated)
```

---

## Updating the Config

When you change settings in iTerm2, export again:

```bash
defaults read ~/Library/Preferences/com.googlecode.iterm2 \
  > console/iterm2/iterm2-full-config/Settings.json
```

### Via iTerm2 GUI

1. iTerm2 → Settings → General → drag Settings.json
2. **Import...** → select the file

---

## Profiles (2)

### 1. Default

Basic profile — for new tabs.

| Parameter | Value |
|---|---|
| **Name** | Default |
| **Guid** | `F2610AC3-706C-4C2A-BB20-F284D51E4296` |
| **Font** | Monaco 12 |
| **Cols / Rows** | 80 / 25 |
| **Scrollback** | 1000 |
| **Option Key Sends** | 0 |
| **Disable Window Resizing** | 1 |
| **Keyboard Map** | (empty — default) |

### 2. best theme

Main working profile — dark theme, custom palette, keyboard mappings.

| Parameter | Value |
|---|---|
| **Name** | best theme |
| **Guid** | `132AB47A-ACD5-4BFD-9100-A0AA285E3AEF` |
| **Default Bookmark** | ✅ (selected by default) |
| **Font** | InconsolataForPowerline-dz 12 |
| **Cols / Rows** | 176 / 40 |
| **Scrollback** | 1000 |
| **Working Directory** | `$HOME` |
| **Transparency** | 0 |
| **Visual Bell** | 1 |
| **Show Status Bar** | 1 |
| **Blinking Cursor** | false |
| **BM Growl** | true |
| **Option Key Sends** | 2 (Meta as Esc) |

#### Color Palette (best theme)

| Color | Red | Green | Blue | Description |
|---|---|---|---|---|
| **Background** | 0 | 0.17 | 0.21 | Dark blue |
| **Foreground** | 0.51 | 0.58 | 0.59 | Grey-blue |
| **Ansi 0** | 0.03 | 0.07 | 0.26 | Dark |
| **Ansi 1** | 0.86 | 0.20 | 0.18 | Red |
| **Ansi 2** | 0.52 | 0.60 | 0 | Green |
| **Ansi 3** | 0.71 | 0.54 | 0 | Yellow |
| **Ansi 4** | 0.15 | 0.55 | 0.82 | Blue |
| **Ansi 5** | 0.83 | 0.21 | 0.51 | Magenta |
| **Ansi 6** | 0.16 | 0.63 | 0.60 | Teal |
| **Ansi 7** | 0.93 | 0.91 | 0.84 | Light grey |
| **Ansi 8** | 0.28 | 0.33 | 0.47 | Grey |
| **Ansi 9** | 0.80 | 0.29 | 0.09 | Bright red |
| **Ansi 10** | 0.35 | 0.43 | 0.46 | Grey-green |
| **Ansi 11** | 0.40 | 0.48 | 0.51 | Grey-yellow |
| **Ansi 12** | 0.51 | 0.58 | 0.59 | Grey-blue |
| **Ansi 13** | 0.42 | 0.44 | 0.77 | Purple |
| **Ansi 14** | 0.58 | 0.63 | 0.63 | Light teal |
| **Ansi 15** | 0.99 | 0.96 | 0.89 | White |

#### Keyboard Map (best theme)

| Combination | Output |
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

## Global Settings

### AI (iTerm2 AI)

| Parameter | Value |
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

### Window Frames

| Frame | Position | Size |
|---|---|---|
| iTerm Main Window | 382, 391 | 1418×738 |
| NSColorPanel | 0, 83 | 250×297 |
| SUUpdateAlert | 590, 559 | 620×402 |
| SUStatusFrame | 700, 756 | 400×139 |

### System

| Parameter | Value |
|---|---|
| macOS | Version 26.6.2 (Build 25G83) |
| Screen | 1800×1169 |
| iTerm2 versions | 3.6.6, 3.6.8, 3.6.9, 3.6.10, 3.6.11 |
| AppleWindowTabbingMode | manual |
| AppleScrollAnimationEnabled | 0 (disabled) |
| ApplePressAndHoldEnabled | 0 |

---

## Notes

- File is in **Apple Property List** format (not plain JSON)
- `Default Bookmark Guid` points to **"best theme"** — the default profile
- `Working Directory` in "best theme" — `$HOME`
- **Powerline fonts** must be installed (see main README)
- Old `best theme.json` — deprecated, full config is in `iterm2-full-config/Settings.json`
