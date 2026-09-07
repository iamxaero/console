# Bash Configuration

> Базовая конфигурация bash для DevOps-окружения.

---

## Установка

```bash
# Symlink
ln -sf $(pwd)/console/shell/bash/.bashrc ~/.bashrc
```

---

## Ключевые настройки

- PATH настройки
- Ansible environment variables
- Python aliases (uv)
- SSH setup
- Git aliases

---

## Зависимости

| Зависимость | Зачем |
|---|---|
| powerline-shell | Powerline prompt для bash (опционально) |
| uv | Управление Python версиями |

---

## Troubleshooting

### Aliases не работают

```bash
# Убедись что .bashrc линкнут
ls -la ~/.bashrc

# Если нет — пересоздай линк
ln -sf $(pwd)/console/shell/bash/.bashrc ~/.bashrc
```

### SSH не добавляет ключи

```bash
# Проверь что ключи существуют
ls -la ~/.ssh/id_ed25519 ~/.ssh/id_rsa 2>/dev/null
```
