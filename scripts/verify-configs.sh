#!/bin/bash
# Проверка всех конфигов проекта console
# Запуск: bash console/scripts/verify-configs.sh

PROJECT_ROOT="$HOME/github/console"
FAILED=0

echo "=== Проверка локальных конфигов ==="
echo ""

# Shell
test -L ~/.zshrc    && echo "✅ ~/.zshrc     → symlink → $(readlink ~/.zshrc)"    || { echo "❌ ~/.zshrc      MISSING or not symlink"; FAILED=$((FAILED+1)); }
test -L ~/.bashrc   && echo "✅ ~/.bashrc     → symlink → $(readlink ~/.bashrc)"   || { echo "❌ ~/.bashrc      MISSING or not symlink"; FAILED=$((FAILED+1)); }
test -f "$PROJECT_ROOT/shell/.inputrc" && echo "✅ .inputrc      → в проекте"     || { echo "❌ .inputrc       MISSING in project"; FAILED=$((FAILED+1)); }

# Editors
test -L ~/.config/nvim   && echo "✅ ~/.config/nvim   → symlink → $(readlink ~/.config/nvim)"   || { echo "❌ ~/.config/nvim  MISSING"; FAILED=$((FAILED+1)); }
test -L ~/.vimrc   && echo "✅ ~/.vimrc   → symlink → $(readlink ~/.vimrc)"   || { echo "❌ ~/.vimrc       MISSING"; FAILED=$((FAILED+1)); }
test -d ~/.vim     && echo "✅ ~/.vim         → exists ($(ls -1 ~/.vim | wc -l | tr -d ' ') files/dirs)" || { echo "❌ ~/.vim         MISSING"; FAILED=$((FAILED+1)); }

# Zed
test -L ~/.config/zed/settings.json && echo "✅ zed/settings.json     → symlink → $(readlink ~/.config/zed/settings.json)" || { echo "❌ zed/settings.json   MISSING or not symlink"; FAILED=$((FAILED+1)); }
test -f "$PROJECT_ROOT/zed/settings.json"  && echo "✅ zed/settings.json     → в проекте" || { echo "❌ zed/settings.json   MISSING in project"; FAILED=$((FAILED+1)); }
test -f "$PROJECT_ROOT/zed/README.md"      && echo "✅ zed/README.md         → в проекте" || { echo "❌ zed/README.md       MISSING in project"; FAILED=$((FAILED+1)); }

# Git & Ansible
test -L ~/.gitconfig && echo "✅ ~/.gitconfig     → symlink → $(readlink ~/.gitconfig)" || { echo "❌ ~/.gitconfig      MISSING"; FAILED=$((FAILED+1)); }
test -L ~/.ansible/ansible.cfg && echo "✅ ansible.cfg   → symlink" || { echo "❌ ansible.cfg        MISSING"; FAILED=$((FAILED+1)); }

# Files
test -f ~/.vault_pass && echo "✅ ~/.vault_pass    → exists" || { echo "❌ ~/.vault_pass      MISSING"; FAILED=$((FAILED+1)); }
test -d ~/.go         && echo "✅ ~/.go            → exists" || { echo "❌ ~/.go               MISSING"; FAILED=$((FAILED+1)); }

# iTerm2
test -f "$PROJECT_ROOT/iterm2/iterm2-full-config/Settings.json" && echo "✅ iterm2 config    → в проекте" || { echo "❌ iterm2 config     MISSING"; FAILED=$((FAILED+1)); }

# Homebrew
command -v brew     >/dev/null && echo "✅ Homebrew         → $(brew --prefix 2>/dev/null)" || { echo "❌ Homebrew          NOT installed"; FAILED=$((FAILED+1)); }
command -v zsh      >/dev/null && echo "✅ zsh              → $(which zsh)"               || { echo "❌ zsh               NOT installed"; FAILED=$((FAILED+1)); }
command -v nvim     >/dev/null && echo "✅ nvim             → $(which nvim)"            || { echo "❌ nvim              NOT installed"; FAILED=$((FAILED+1)); }
command -v vim      >/dev/null && echo "✅ vim              → $(which vim)"             || { echo "❌ vim               NOT installed"; FAILED=$((FAILED+1)); }
command -v ansible  >/dev/null && echo "✅ ansible          → $(which ansible)"         || { echo "❌ ansible           NOT installed"; FAILED=$((FAILED+1)); }
command -v uv       >/dev/null && echo "✅ uv               → $(which uv)"              || { echo "❌ uv                NOT installed"; FAILED=$((FAILED+1)); }

# SSH
test -d ~/.ssh && echo "✅ ~/.ssh          → exists" || { echo "❌ ~/.ssh            MISSING"; FAILED=$((FAILED+1)); }

# Zsh plugins
test -d "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions" && echo "✅ zsh-autosuggestions  → installed" || { echo "❌ zsh-autosuggestions  NOT installed"; FAILED=$((FAILED+1)); }
test -d "$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting" && echo "✅ zsh-syntax-highlighting → installed" || { echo "❌ zsh-syntax-highlighting NOT installed"; FAILED=$((FAILED+1)); }

echo ""
echo "=== Итого: ошибок $FAILED ==="

if [ $FAILED -eq 0 ]; then
  echo "✅ Все конфиги на месте, пути верные"
else
  echo "❌ Найдено $FAILED проблем — см. выше"
fi
