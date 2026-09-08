# Neovim Configuration

> Full Neovim configuration for DevOps engineer. dein.vim plugin manager, deoplete, 73 plugins.

---

## Installation (for agents)

### 1. Install Neovim

```bash
brew install neovim
```

### 2. Symlink config

```bash
# If old config exists — move it
mv ~/.config/nvim ~/.config/nvim.bak 2>/dev/null

# Symlink
ln -s $(pwd)/console/neovim ~/.config/nvim
```

### 3. Build vimproc.vim (critical for deoplete)

```bash
# Clone vimproc
git clone https://github.com/Shougo/vimproc.vim.git ~/.config/nvim/dein/repos/github.com/Shougo/vimproc.vim

# Build
cd ~/.config/nvim/dein/repos/github.com/Shougo/vimproc.vim && make
```

### 4. Install Python pipeline for deoplete

```bash
# Install pynvim (bridge between Neovim and Python)
uv pip install --system --break-system-packages pynvim

# Or if uv doesn't work:
# pip3 install --break-system-packages pynvim
```

### 5. Install all plugins

```bash
# Headless mode — faster
nvim --headless -c ":call dein#install()" -c ":qall"

# OR via UpdateRemotePlugins (if deoplete doesn't load):
nvim --headless -c ":UpdateRemotePlugins" -c ":qall"
```

---

## Structure

```
neovim/
├── init.vim              # Main config (sources base.vim + plugins.vim + settings.vim)
├── base.vim              # Common settings for vim and neovim (indentation, search, folding, etc.)
├── plugins.vim           # dein.vim plugin manager: loads dein and all plugins/*.vim
├── settings.vim          # Dynamically loads all settings/*.vim
├── .gitignore
│
├── dein/                 # dein.vim plugin manager (Git repo)
│   ├── autoload/
│   ├── repos/            # All installed plugins here
│   └── ...
│
├── plugins/              # Define all dependencies via dein#add()
│   ├── base.vim          # unite, vimfiler, vimshell, deoplete, vimproc, tpope/*, session, etc.
│   ├── languages.vim     # syntastic→jedi-vim, vim-polyglot, markdown, javascript, go, rust, etc.
│   ├── git.vim           # gitv, gist, fugitive, git, gitgutter
│   ├── appearance.vim    # colorizer, solarized, lightline
│   ├── search.vim        # sneak, ag, easymotion, greplace
│   ├── textobjects.vim   # kana/vim-textobj-*, indent-guides
│   └── vim-improvements.vim # splitjoin, delimitMate, multiple-cursors, yankring, etc.
│
├── settings/             # Plugin configs (deoplete, lightline, etc.)
│   ├── appearance.vim
│   ├── binary-hex.vim
│   ├── deoplete.vim
│   ├── lang-javascript.vim
│   ├── lightline.vim
│   ├── unite.vim
│   ├── vim-fold.vim
│   ├── vim-ident-guides.vim
│   ├── vim-session.vim
│   ├── vim-whitespace.vim
│   └── vimfiller.vim
│
├── cache/                # dein.vim cache (generated automatically)
├── pack/                 # Pack directory (kite autocomplete)
│   └── kite/
└── thex/                 # Local plugin (autoload)
```

---

## Key Plugins

### Plugin Manager
- **dein.vim** — fast plugin manager, clones deps on install

### UI & Status
- **lightline.vim** — status line
- **vim-colors-solarized** — solarized color scheme
- **colorizer** — inline hex color preview

### Navigation & File Management
- **unite.vim** — unified search interface (DEPRECATED → telescope.nvim)
- **vimfiler.vim** — file manager (DEPRECATED → nvim-tree)
- **vimshell.vim** — terminal inside vim (DEPRECATED → toggleterm.nvim)
- **xolox/vim-session** — session management

### Auto-completion
- **deoplete.nvim** — smart auto-completion (requires pynvim + vimproc.vim)
- **vimproc.vim** — async execution backend (MUST be built manually)

### Git Integration
- **vim-fugitive** — Git integration by tpope
- **vim-git** — Git integration by tpope
- **vim-gitgutter** — Git gutter in sign column
- **gitv** — Git browser
- **gist-vim** — GitHub gists

### Language Support
- **vim-polyglot** — multi-language syntax
- **vim-go** — Go language support (fatih)
- **rust.vim** — Rust support
- **jedi-vim** — Python auto-completion (replaced syntastic)
- **vim-javascript** — JavaScript syntax
- **vim-flavored-markdown** — Markdown syntax
- **Vim-Jinja2-Syntax** — Jinja2 syntax
- **vim-hclfmt** — HCL formatting (Terraform)
- **vim-syntax-syslog-ng** — Syslog syntax
- **logstash.vim** — Logstash syntax
- **bind.vim** — Bind syntax
- **ejs-syntax** — EJS syntax

### Search & Replace
- **vim-sneak** — enhanced search with sneak
- **ag.vim** — The Silver Searcher integration
- **vim-easymotion** — jump to positions easily
- **greplace.vim** — grep and replace

### Text Objects
- **kana/vim-textobj-datetime** — date/time objects
- **kana/vim-textobj-entire** — entire file object
- **kana/vim-textobj-function** — function objects
- **kana/vim-textobj-user** — custom text objects
- **vim-textobj-underscore** — underscore objects
- **vim-indentobject** — indentation-based objects
- **vim-indent-guides** — visual indentation guides
- **vim-textobj-rubyblock** — Ruby blocks
- **vim-textobj-function-javascript** — JS function objects
- **vim-textobj-rubysymbol** — Ruby symbols
- **textobj-word-column** — word columns
- **vim-textobj-datetime** — datetime objects
- **argtextobj.vim** — argument objects

### Editing Enhancements
- **splitjoin.vim** — split/join assignments
- **delimitMate** — auto-closing delimiters
- **tcomment_vim** — comment toggling
- **multiple-cursors** — multiple selections
- **yankring.vim** — yank history
- **change-inside-surroundings** — change inside surroundings
- **tabular** — align text
- **vim-surround** — surround/delete/change
- **vim-repeat** — repeat plugin commands with `.`
- **vim-abolish** — case substitution, plurals
- **vim-endwise** — end keywords for Ruby
- **vim-ragtag** — HTML/PHP tag handling
- **vim-unimpaired** — key mappings for lists, ranges
- **NrrwRgn** — narrow region
- **vim-addon-mw-utils** — utils for vim plugins
- **file-line** — file line numbers
- **vim-misc** — misc utils
- **AnsiEsc** — ANSI escape code converter
- **AutoTag** — auto HTML tags
- **lastpos.vim** — last position marker
- **sudo.vim** — save with :w !sudo tee
- **ctrlr.vim** — clipboard integration
- **gundo.vim** — undo tree
- **investigate.vim** — vim investigation tool
- **matchit** — matching for %
- **vimfiller** — filler line support

---

## DEPRECATED (scheduled for replacement)

| Plugin | Replace with | Reason |
|---|---|---|
| unite.vim | telescope.nvim | Deprecated, slow |
| vimfiler.vim | nvim-tree.lua / neo-tree | Deprecated |
| vimshell.vim | toggleterm.nvim | Deprecated |
| syntastic | ale / jedi-vim | Dead, unmaintained |
| deoplete.nvim | nvim-cmp / LSP | Heavy, deoplete slower than LSP |

---

## Plugin Management

### Install/Update All Plugins

```bash
nvim --headless -c ":call dein#install()" -c ":qall"
```

### Remove Unused Plugins

```bash
nvim --headless -c ":call dein#clean()" -c ":qall"
```

### Add New Plugin

1. Open the relevant file in `plugins/*.vim`
2. Add line: `call dein#add("owner/repo.git")`
3. Run: `nvim --headless -c ":call dein#install()" -c ":qall"`

### Update Specific Plugin

```bash
nvim --headless -c ":call dein#update('owner/repo')" -c ":qall"
```

### List Installed Plugins

```bash
nvim --headless -c ":call dein#list()" -c ":qall"
```

---

## Troubleshooting

### deoplete not loading

```bash
# 1. Check Python 3
nvim --headless -c "echo has('python3')" -c ":q"
# Should be: 1

# 2. Install pynvim
uv pip install --system --break-system-packages pynvim

# 3. Re-register remote plugins
nvim --headless -c ":UpdateRemotePlugins" -c ":qall"

# 4. Build vimproc (if not built)
cd ~/.config/nvim/dein/repos/github.com/Shougo/vimproc.vim && make

# 5. Restart Neovim
nvim
```

### vimproc not building

```bash
# Check that clang is installed
xcode-select --install

# Try without Python support
cd ~/.config/nvim/dein/repos/github.com/Shougo/vimproc.vim
make NO_PYTHON=1
```

### Unknown error on launch

```bash
# Full reset and reinstall
rm -rf ~/.local/share/nvim
rm -rf ~/.config/nvim/dein/cache

# Reload config
nvim --headless -c ":call dein#rebuild_cache()" -c ":qall"
```

### checkhealth not working

In Neovim 0.10+ `:checkhealth` may fail with errors due to dein incompatibility. If `checkhealth` doesn't work — just open `nvim` and check the statusline for errors.

---

## Notes

- **base.vim** contains common settings (indentation, search, folding, completion, scrolling). It is used by both `vimrc` and `init.vim`.
- **dein.vim** clones all plugins into `~/.config/nvim/dein/repos/` on first launch.
- **vimproc.vim** must be built manually — dein does not build it automatically.
- **pynvim** is required for deoplete (auto-completion).
- For macOS: `make` for vimproc uses clang from Xcode Command Line Tools.
