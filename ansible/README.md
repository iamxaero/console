# Ansible Configuration

> Ansible конфиг с настройками для управления серверами.

---

## Установка

```bash
# Установи Ansible
brew install ansible

# Symlink
ln -sf $(pwd)/console/ansible/ansible.cfg ~/.ansible/ansible.cfg

# Создай vault password (НЕ коммить этот файл!)
openssl rand -base64 32 > ~/.vault_pass
chmod 600 ~/.vault_pass
```

---

## Ключевые настройки

| Параметр | Значение |
|---|---|
| `nocows` | 1 |
| `gathering` | smart |
| `fact_caching_timeout` | 7200 |
| `forks` | 20 |
| `timeout` | 60 |
| `transport` | ssh |
| `pipelining` | True |
| `vault_password_file` | `~/.vault_pass` |
| `inventory` | `inventory` (относительно ~/.ansible) |
| `roles_path` | `roles/vendor` |

### Environment variables

```bash
export ANSIBLE_VAULT_PASSWORD_FILE=~/.vault_pass
export ANSIBLE_LOG_PATH=~/.ansible/ansible.log
export ANSIBLE_STDOUT_CALLBACK='yaml'
export ANSIBLE_STRATEGY_PLUGINS=~/.ansible/plugins/mitogen
export ANSIBLE_CONFIG=~/.ansible/ansible.cfg
```

---

## Зависимости

| Зависимость | Зачем |
|---|---|
| mitogen | Стратегия плагин для ускорения Ansible |
| vault_pass | Файл с паролем для ansible-vault |

---

## Troubleshooting

### MITOGEN не загружается

```bash
# Убедись что mitogen установлен
mkdir -p ~/.ansible/plugins/mitogen
# Скачай mitogen в этот путь
```

### Vault password не найден

```bash
# Создай файл
openssl rand -base64 32 > ~/.vault_pass
chmod 600 ~/.vault_pass
```
