# Shell Configuration

> Общие настройки для bash и zsh. Включает плагины Oh-My-Zsh, shell plugins и общие переменные окружения.

---

## Структура

```
shell/
├── README.md              # ← Этот файл
├── .inputrc               # Readline config (bash, python REPL, и др.)
├── bash/
│   ├── README.md          # Bash-specific setup
│   └── .bashrc
└── zsh/
    ├── README.md          # Zsh-specific setup
    └── .zshrc
```

---

## Быстрый старт

```bash
# Symlink конфигов
ln -sf $(pwd)/console/shell/zsh/.zshrc ~/.zshrc
ln -sf $(pwd)/console/shell/bash/.bashrc ~/.bashrc
ln -sf $(pwd)/console/shell/.inputrc ~/.inputrc

# Установи зависимости (см. shell/zsh/README.md)
```

---

## Зависимости

| Зависимость | Зачем |
|---|---|
| Powerline fonts | Иконки в theme agnoster |
| Oh-My-Zsh | Фреймворк для zsh |
| zsh-autosuggestions | Подсказки команд |
| zsh-syntax-highlighting | Подсветка синтаксиса |
| uv (или pyenv) | Python менеджеры |
| powerline-shell | Powerline prompt для bash |

---

## Troubleshooting

### Theme agnoster не показывает иконки

```bash
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts && ./install.sh && cd .. && rm -rf fonts
```

### uv не работает

```bash
# Если нужен старый pyenv:
# Раскомментируй секцию pyenv в .bashrc
brew install pyenv-virtualenv
```
