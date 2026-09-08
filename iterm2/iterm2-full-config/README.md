# iTerm2 Configuration

> Full export of iTerm2 config from `~/Library/Preferences/com.googlecode.iterm2.plist`
>
> Format: Apple Property List (plist-style), not plain JSON

---

## Updating the Config

When you change settings in iTerm2, export again:

```bash
# Via defaults (command line)
defaults read /Users/vk/Library/Preferences/com.googlecode.iterm2 \
  > console/iterm/iterm2-full-config/Settings.json
```

### Via iTerm2 GUI

1. Open iTerm2
2. iTerm2 → Settings → General
3. Drag `Settings.json` into the settings window
4. Or: **File → Import Settings**

---

## Config Structure

The file contains three main parts:

1. **Global settings** — AI, window frames, system parameters
2. **New Bookmarks** — profiles array (2)
3. **NoSync** — system info, variables, metadata

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

### Window Frames

| Frame | Position | Size | Monitor |
|---|---|---|---|
| iTerm Main Window | 382, 391 | 1418×738 | -1 (main) |
| NSColorPanel | 0, 83 | 250×297 | - |
| SUUpdateAlert | 590, 559 | 620×402 | - |
| SUStatusFrame | 700, 756 | 400×139 | - |

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
| `AIVectorStore` | 0 |

---

## Profiles (New Bookmarks)

### 1. Default

Basic profile — for new tabs and windows.

| Parameter | Value |
|---|---|
| **Name** | Default |
| **Guid** | `F2610AC3-706C-4C2A-BB20-F284D51E4296` |
| **Font** | Monaco 12 |
| **Non-ASCII Font** | Monaco 12 |
| **Cols / Rows** | 80 / 25 |
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
| **Keyboard Map** | (empty — defaults) |

### 2. best theme

Main working profile — dark theme, custom palette, keyboard mappings.

| Parameter | Value |
|---|---|
| **Name** | best theme |
| **Guid** | `132AB47A-ACD5-4BFD-9100-A0AA285E3AEF` |
| **Default Bookmark** | (selected by default) |
| **Font** | InconsolataForPowerline-dz 12 |
| **Non-ASCII Font** | Menlo-Regular 11 |
| **Cols / Rows** | 176 / 40 |
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
| **Shortcut** | (empty) |

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

#### Additional Colors (best theme)

| Color | Red | Green | Blue |
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

Custom keyboard mappings:

| Combination | Action | Output |
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

| Key | Value |
|---|---|
| `Option Key Sends` | 2 |
| `Right Option Key Sends` | 2 |

Value `2` means: send `Meta` (⌥) as Esc.

#### Status Bar

```
iTermStatusBarJobComponent
  - base: priority: 5
  - base: compression resistance: 1
  - algorithm: 0
  - font: .AppleSystemUIFont 12
```

---

## NoSync (System Info)

### macOS

| Parameter | Value |
|---|---|
| **Version** | Version 26.6.2 (Build 25G83) |
| **Screen** | 1800×1169 |
| **Window Preferences** | topLeft: 507, 928 |
| **Last Root Directory** | `/Users/vk/git` (hex-encoded) |

### iTerm2

| Parameter | Value |
|---|---|
| **Versions** | 3.6.6, 3.6.8, 3.6.9, 3.6.10, 3.6.11 |
| **Installation ID** | 290E5D56-9D68-4CF3-8F02-3ABF52405CDD |
| **Python Version Requirement** | 1.17 |
| **Launch Experience Run Count** | 39 |
| **Ignore System Window Restoration** | 1 |
| **Permission to Show Tip** | 0 |

### Recorded Variables (32 total)

profileName, tmuxRole, lastCommand, hostname, path, shell, selection, processTitle, columns, rows, tmuxWindowPane, tmuxPaneTitle, tmuxStatusLeft, tmuxStatusRight, tmuxWindowPaneIndex, tmuxClientName, triggerName, autoName, badge, username, pid, jobPid, effective_root_pid, sshIntegrationLevel, terminalWindowName, creationTimeString, commandLine, applicationKeypad, tab, tab.tmuxWindowName, tab.tmuxWindowTitle, iterm2, parentSession, isHotkeyWindow, currentTab, currentTab.currentSession.pid, currentTab.currentSession.mouseInfo, currentTab.currentSession.termid, currentTab.currentSession.terminalWindowName, currentTab.currentSession.terminalIconName, currentTab.currentSession.processTitle

---

## Installing on a New Machine

### Method 1: via defaults (full import)

```bash
# Export current (backup)
defaults read /Users/vk/Library/Preferences/com.googlecode.iterm2 \
  > ~/iterm2-backup-$(date +%Y%m%d).json

# Import new
defaults read /path/to/Settings.json > /tmp/iterm2-import.plist

# Reset current config
defaults delete com.googlecode.iterm2

# Write new
defaults read /tmp/iterm2-import.plist > /tmp/iterm2-final.plist
defaults write com.googlecode.iterm2 < /tmp/iterm2-final.plist

# Restart
killall iTerm2
```

### Method 2: via GUI

1. Open iTerm2
2. iTerm2 → Settings → General
3. Drag `Settings.json` into the settings window
4. Restart iTerm2

### Method 3: profile import (colors and settings only)

1. Open iTerm2 → Settings → Profiles
2. Select a profile
3. Import `best theme.json` (old, profile only)

---

## Notes

- File is in **Apple Property List** format (not standard JSON)
- `Default Bookmark Guid` points to **"best theme"** profile (GUID: `132AB47A-...`)
- **"best theme"** — default profile, used on new window
- **"Default"** — basic, uncustomized
- `Working Directory` is set to `$HOME` (not hardcoded)
- **AI configured**: GPT-5.5 via OpenAI API, 1050000 tokens
- **Fonts**: Monaco (Default), InconsolataForPowerline-dz (best theme)
- **Powerline fonts** must be installed (see project README)
