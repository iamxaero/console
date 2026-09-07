# Neovim Configuration

> Полная конфигурация Neovim для DevOps-инженера. dein.vim plugin manager, deoplete, 73 плагина.

---

## Установка (для агентов)

### 1. Установи Neovim

```bash
brew install neovim
```

### 2. Symlink конфига

```bash
# Если старый конфиг есть — перемести
mv ~/.config/nvim ~/.config/nvim.bak 2>/dev/null

# Symlink
ln -s $(pwd)/console/neovim ~/.config/nvim
```

### 3. Построй vimproc.vim (критично для deoplete)

```bash
# Клонируй vimproc
git clone https://github.com/Shougo/vimproc.vim.git ~/.config/nvim/dein/repos/github.com/Shougo/vimproc.vim

# Собери
cd ~/.config/nvim/dein/repos/github.com/Shougo/vimproc.vim && make
```

### 4. Установи Python пайплайн для deoplete

```bash
# Установи pynvim (мост между Neovim и Python)
uv pip install --system --break-system-packages pynvim

# Или если uv не работает:
# pip3 install --break-system-packages pynvim
```

### 5. Установи все плагины

```bash
# Headless режим — быстрее
nvim --headless -c ":call dein#install()" -c ":qall"

# ИЛИ через UpdateRemotePlugins (если deoplete не загружается):
nvim --headless -c ":UpdateRemotePlugins" -c ":qall"
```

---

## Структура

```
neovim/
├── init.vim              # Главный конфиг (sources base.vim + plugins.vim + settings.vim)
├── base.vim              # Общие настройки для vim и neovim (indentation, search, folding, etc.)
├── plugins.vim           # dein.vim plugin manager: загружает dein и все plugins/*.vim
├── settings.vim          # Динамически загружает все settings/*.vim
├── .gitignore
│
├── dein/                 # dein.vim plugin manager (Git repo)
│   ├── autoload/
│   ├── repos/            # Все установленные плагины здесь
│   └── ...
│
├── plugins/              # Определяют все зависимости через dein#add()
│   ├── base.vim          # unite, vimfiler, vimshell, deoplete, vimproc, tpope/*, session, etc.
│   ├── languages.vim     # syntastic→jedi-vim, vim-polyglot, markdown, javascript, go, rust, etc.
│   ├── git.vim           # gitv, gist, fugitive, git, gitgutter
│   ├── appearance.vim    # colorizer, solarized, lightline
│   ├── search.vim        # sneak, ag, easymotion, greplace
│   ├── textobjects.vim   # kana/vim-textobj-*, indent-guides
│   └── vim-improvements.vim # splitjoin, delimitMate, multiple-cursors, yankring, etc.
│
├── settings/             # Конфиги плагинов (deoplete, lightline, etc.)
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
├── cache/                # Cache dein.vim (генерируется автоматически)
├── pack/                 # Pack directory (kite autocomplete)
│   └── kite/
└── thex/                 # Локальный плагин (autoload)
```

---

## Ключевые плагины

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

## DEPRECATED (запланирована замена)

| Плагин | Заменить на | Причина |
|---|---|---|
| unite.vim | telescope.nvim | Устарел, медленный |
| vimfiler.vim | nvim-tree.lua / neo-tree | Устарел |
| vimshell.vim | toggleterm.nvim | Устарел |
| syntastic | ale / jedi-vim | Мёртв, не поддерживается |
| deoplete.nvim | nvim-cmp / LSP | Heavy, deoplete медленнее LSP |

---

## Управление плагинами

### Установить/обновить все плагины

```bash
nvim --headless -c ":call dein#install()" -c ":qall"
```

### Удалить неиспользуемые плагины

```bash
nvim --headless -c ":call dein#clean()" -c ":qall"
```

### Добавить новый плагин

1. Открой нужный файл в `plugins/*.vim`
2. Добавь строку: `call dein#add("owner/repo.git")`
3. Запусти: `nvim --headless -c ":call dein#install()" -c ":qall"`

### Обновить конкретный плагин

```bash
nvim --headless -c ":call dein#update('owner/repo')" -c ":qall"
```

### Список установленных плагинов

```bash
nvim --headless -c ":call dein#list()" -c ":qall"
```

---

## troubleshooting

### deoplete не загружается

```bash
# 1. Проверь Python 3
nvim --headless -c "echo has('python3')" -c ":q"
# Должно быть: 1

# 2. Установи pynvim
uv pip install --system --break-system-packages pynvim

# 3. Перерегистрируй remote plugins
nvim --headless -c ":UpdateRemotePlugins" -c ":qall"

# 4. Построй vimproc (если не собран)
cd ~/.config/nvim/dein/repos/github.com/Shougo/vimproc.vim && make

# 5. Перезапусти Neovim
nvim
```

### vimproc не собирается

```bash
# Проверь что clang установлен
xcode-select --install

# Попробуй без Python support
cd ~/.config/nvim/dein/repos/github.com/Shougo/vimproc.vim
make NO_PYTHON=1
```

### Непонятная ошибка при запуске

```bash
# Полный сброс и переустановка
rm -rf ~/.local/share/nvim
rm -rf ~/.config/nvim/dein/cache

# Перезагрузи конфиг
nvim --headless -c ":call dein#rebuild_cache()" -c ":qall"
```

### checkhealth не работает

В Neovim 0.10+ `:checkhealth` может падать с ошибками из-за несовместимости с dein. Если `checkhealth` не работает — просто открывай `nvim` и смотри на ошибки в статуслайне.

---

## Notes

- **base.vim** содержит общие настройки (indentation, search, folding, completion, scrolling). Он используется и `vimrc`, и `init.vim`.
- **dein.vim** клонирует все плагины в `~/.config/nvim/dein/repos/` при первом запуске.
- **vimproc.vim** нужно собирать вручную — dein не строит его автоматически.
- **pynvim** обязателен для deoplete (автодополнение).
- Для macOS: `make` для vimproc использует clang из Xcode Command Line Tools.
