# Vim (Legacy) Configuration

> Классический Vim конфиг с Vundle plugin manager. Legacy — используется для совместимости со старыми скриптами.

---

## Установка

```bash
# Установи Vim
brew install vim

# Symlink основного конфига
ln -sf $(pwd)/console/vim/.vimrc ~/.vimrc

# Symlink директории vim
ln -sf $(pwd)/console/vim ~/.vim
```

---

## Структура

```
vim/
├── .vimrc              # Главный конфиг (sources vundles.vim + base.vim)
├── vundles.vim         # Vundle plugin definitions (разбит по категориям)
├── base.vim            # Общие настройки для vim и neovim
├── ruby.vundle         # Ruby плагины
├── languages.vundle    # Языковые пакеты
├── git.vundle          # Git инструменты
├── appearance.vundle   # Цвета и UI
├── textobjects.vundle  # Text objects
├── search.vundle       # Поиск
├── project.vundle      # Проекты
└── vim-improvements.vundle # Улучшения Vim
```

---

## Vundle Плагины

### Установка плагинов

```bash
vim --noplugin -u ~/.vim/vundles.vim -N "+set hidden" "+syntax on" +BundleClean! +BundleInstall +qall
```

### Категории

| Файл | Категория |
|---|---|
| ruby.vundle | Ruby плагины |
| languages.vundle | Языковые пакеты |
| git.vundle | Git инструменты |
| appearance.vundle | Цвета и UI |
| textobjects.vundle | Text objects |
| search.vundle | Поиск |
| project.vundle | Проекты |
| vim-improvements.vundle | Улучшения Vim |

---

## Управление плагинами

### Обновить плагины

```bash
vim --noplugin -u ~/.vim/vundles.vim -N "+set hidden" "+syntax on" +BundleClean! +BundleInstall +qall
```

### Добавить новый плагин

1. Открой нужный файл в `vim/*.vundle`
2. Добавь строку: `Bundle 'owner/repo'`
3. Запусти установку (см. выше)

---

## Troubleshooting

### Vundle не загружается

```bash
# Убедись что .vimrc линкнут
ls -la ~/.vimrc

# Пересоздай Vundle
rm -rf ~/.vim/bundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Установи плагины
vim --noplugin -u ~/.vim/vundles.vim -N "+set hidden" "+syntax on" +BundleClean! +BundleInstall +qall
```

### Плагин не устанавливается

```bash
# Проверь интернет-соединение
# Убедись что git clone работает
git clone https://github.com/owner/repo.git /tmp/test-clone

# Проверь права
ls -la ~/.vim/bundle/
```
