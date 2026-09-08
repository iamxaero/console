# iTerm2 Configuration

> Full export of iTerm2 config from `~/Library/Preferences/com.googlecode.iterm2.plist`
>
> Format: Apple Property List (plist-style), not plain JSON. **Not symlinkable** — import via GUI or CLI.

---

## Structure

```
iterm2/
├── README.md                          # ← This file
└── iterm2-full-config/
    └── Settings.json                  # Full config export (~60KB)
```

---

## Installing on a New Machine

### Full config (Settings.json → complete iTerm2 setup)

**Only via CLI** — drag & drop in GUI does NOT work for full config.

```bash
# 1. Backup current

defaults read ~/Library/Preferences/com.googlecode.iterm2 \
  > ~/iterm2-backup-$(date +%Y%m%d).json

# 2. Reset iTerm2 config
defaults delete com.googlecode.iterm2

# 3. Import from project
defaults read /path/to/iterm2-full-config/Settings.json \
  > /tmp/iterm2-final.plist
defaults write com.googlecode.iterm2 /tmp/iterm2-final.plist

# 4. Restart
dd if=/dev/null of=/tmp/iterm2-final.lock; killall iTerm2
```

### Profile only (best theme.json → colors, font, keymap)

**Via GUI only** — drag & drop into a specific profile.

1. Open iTerm2 → Settings → Profiles
2. Select the profile to update
3. Drag `best theme.json` into the settings window
4. Restart iTerm2

---

## Updating the Config

When you change settings in iTerm2, export again:

```bash
defaults read ~/Library/Preferences/com.googlecode.iterm2 \
  > /path/to/console/iterm2/iterm2-full-config/Settings.json
```

---

## Profiles (2)

### 1. Default

Basic profile — for new tabs and windows.

| Parameter | Value |
|---|---|
| **Name** | Default |
| **Font** | Monaco 12 |
| **Non-ASCII Font** | Menlo-Regular 11 |
| **Cols / Rows** | 80 / 25 |
| **Scrollback** | 1000 |
| **Terminal Type** | xterm-256color |
| **Working Directory** | `/Users/vk` |
| **Option Key Sends** | 0 |
| **Disable Window Resizing** | 1 |
| **Custom Locale** | en_US.UTF-8 |

### 2. best theme

Main working profile — dark theme, custom palette, keyboard mappings.

| Parameter | Value |
|---|---|
| **Name** | best theme |
| **Default Bookmark** | ✅ (selected by default) |
| **Font** | InconsolataForPowerline-dz 12 |
| **Non-ASCII Font** | Menlo-Regular 11 |
| **Cols / Rows** | 176 / 40 |
| **Scrollback** | 1000 |
| **Working Directory** | `/Users/xaero` |
| **Terminal Type** | xterm-256color |
| **Transparency** | 0 |
| **Visual Bell** | 1 |
| **Show Status Bar** | 1 |
| **Blinking Cursor** | false |
| **BM Growl** | true |
| **Use Bold / Italic** | 1 / 1 |
| **Horizontal Spacing** | 1.01 |

#### Color Palette (best theme)

| Color | R | G | B | Description |
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

#### Additional Colors (best theme)

| Color | R | G | B |
|---|---|---|---|
| **Cursor Color** | 0.51 | 0.58 | 0.59 |
| **Cursor Text Color** | 0.03 | 0.07 | 0.26 |
| **Selection Color** | 0.03 | 0.21 | 0.26 |
| **Selected Text Color** | 0.58 | 0.63 | 0.63 |
| **Cursor Guide Color** | 0.70 | 0.93 | 1.0 |
| **Link Color** | 0 | 0.36 | 0.73 |
| **Badge Color** | 1 | 0.15 | 0 |

#### Keyboard Map (best theme)

| Combination | Action | Output |
|---|---|---|
| `Esc [A` | Esc Esc Up | `0x1b 0x1b 0x5b 0x41` |
| `Esc [B` | Esc Esc Down | `0x1b 0x1b 0x5b 0x42` |
| `Esc [D]` | Left | `[D` |
| `Esc [C]` | Right | `[C` |
| `Esc [5D]` | Ctrl+Left | `[5D` |
| `Esc [5C]` | Ctrl+Right | `[5C` |
| `Esc [F]` | End | `[F` |
| `Esc [H]` | Home | `[H` |
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

| Key | Value |
|---|---|
| `Option Key Sends` | 2 |
| `Right Option Key Sends` | 2 |

`2` = send `Meta` (⌥) as Esc.

#### Status Bar

```
iTermStatusBarJobComponent
  - base: priority: 5
  - base: compression resistance: 1
  - algorithm: 0
  - font: .AppleSystemUIFont 12
```

---

## Global Settings

### Apple System

| Parameter | Value |
|---|---|
| `AppleWindowTabbingMode` | manual |
| `AppleScrollAnimationEnabled` | 0 (disabled) |
| `ApplePressAndHoldEnabled` | 0 |
| `AppleSmoothFixedFontsSizeThreshold` | 1 |
| `AppleAntiAliasingThreshold` | 1 |
| `NSScrollAnimationEnabled` | 0 |
| `NSScrollViewShouldScrollUnderTitlebar` | 0 |
| `HapticFeedbackForEsc` | 0 |

### Window Frames

| Frame | Position | Size |
|---|---|---|
| iTerm Main Window | 382, 391 | 1418×738 |
| NSColorPanel | 0, 83 | 250×297 |

### AI (iTerm2 AI — local LLM)

| Parameter | Value |
|---|---|
| `AiModel` | **llama4:latest** |
| `AitermURL` | **http://localhost:11434/api/chat** |
| `AITermAPI` | 5 |
| `AIVendor` | 3 |
| `AiMaxTokens` | 10000000 |
| `AiResponseMaxTokens` | 10000000 |
| `AIFeatureFunctionCalling` | 1 |
| `AIFeatureHostedCodeInterpeter` | 0 |
| `AIFeatureHostedFileSearch` | 0 |
| `AIFeatureHostedWebSearch` | 0 |
| `AIFeatureStreamingResponses` | 1 |
| `AIVectorStore` | 0 |

> Uses **Ollama** (local) at `localhost:11434`. Make sure Ollama is running with `llama4:latest` pulled.

---

## NoSync (System Info)

### macOS

| Parameter | Value |
|---|---|
| **Version** | 26.6.2 (Build 25G83) |
| **Screen** | 1800×1169 |

### iTerm2

| Parameter | Value |
|---|---|
| **Version** | 3.6.11 |
| **Installation ID** | 290E5D56-9D68-4CF3-8F02-3ABF52405CDD |
| **Python Version Requirement** | 1.17 |

### Recorded Variables (32)

profileName, tmuxRole, lastCommand, hostname, path, shell, selection, processTitle, columns, rows, tmuxWindowPane, tmuxPaneTitle, tmuxStatusLeft, tmuxStatusRight, tmuxWindowPaneIndex, tmuxClientName, triggerName, autoName, badge, username, pid, jobPid, effective_root_pid, sshIntegrationLevel, terminalWindowName, creationTimeString, commandLine, applicationKeypad, tab, tab.tmuxWindowName, tab.tmuxWindowTitle, iterm2, parentSession, isHotkeyWindow, currentTab, currentTab.currentSession.pid, currentTab.currentSession.mouseInfo, currentTab.currentSession.termid, currentTab.currentSession.terminalWindowName, currentTab.currentSession.terminalIconName, currentTab.currentSession.processTitle

---

## Notes

- Config is in **Apple Property List** format — import via GUI or `defaults` CLI
- `Default Bookmark Guid` → **"best theme"** — the default profile for new windows
- **AI**: llama4 via Ollama (local), not OpenAI
- **Powerline fonts** must be installed (see project README)
