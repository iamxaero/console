# Vim (Legacy) Configuration

> Classic Vim config with Vundle plugin manager. Legacy — used for compatibility with old scripts.

---

## Installation

```bash
# Install Vim
brew install vim

# Symlink main config
ln -sf $(pwd)/console/vim/.vimrc ~/.vimrc

# Symlink vim directory
ln -sf $(pwd)/console/vim ~/.vim
```

---

## Structure

```
vim/
├── .vimrc              # Main config (sources vundles.vim + base.vim)
├── vundles.vim         # Vundle plugin definitions (broken down by category)
├── base.vim            # Common settings for vim and neovim
├── ruby.vundle         # Ruby plugins
├── languages.vundle    # Language packs
├── git.vundle          # Git tools
├── appearance.vundle   # Colors and UI
├── textobjects.vundle  # Text objects
├── search.vundle       # Search
├── project.vundle      # Projects
└── vim-improvements.vundle # Vim improvements
```

---

## Vundle Plugins

### Installing Plugins

```bash
vim --noplugin -u ~/.vim/vundles.vim -N "+set hidden" "+syntax on" +BundleClean! +BundleInstall +qall
```

### Categories

| File | Category |
|---|---|
| ruby.vundle | Ruby plugins |
| languages.vundle | Language packs |
| git.vundle | Git tools |
| appearance.vundle | Colors and UI |
| textobjects.vundle | Text objects |
| search.vundle | Search |
| project.vundle | Projects |
| vim-improvements.vundle | Vim improvements |

---

## Plugin Management

### Update Plugins

```bash
vim --noplugin -u ~/.vim/vundles.vim -N "+set hidden" "+syntax on" +BundleClean! +BundleInstall +qall
```

### Add New Plugin

1. Open the relevant file in `vim/*.vundle`
2. Add line: `Bundle 'owner/repo'`
3. Run installation (see above)

---

## Troubleshooting

### Vundle not loading

```bash
# Make sure .vimrc is symlinked
ls -la ~/.vimrc

# Reinstall Vundle
rm -rf ~/.vim/bundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Install plugins
vim --noplugin -u ~/.vim/vundles.vim -N "+set hidden" "+syntax on" +BundleClean! +BundleInstall +qall
```

### Plugin not installing

```bash
# Check internet connection
# Make sure git clone works
git clone https://github.com/owner/repo.git /tmp/test-clone

# Check permissions
ls -la ~/.vim/bundle/
```
