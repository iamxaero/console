# Ansible Configuration

> Ansible config with settings for server management.

---

## Installation

```bash
# Install Ansible
brew install ansible

# Symlink
ln -sf $(pwd)/console/ansible/ansible.cfg ~/.ansible/ansible.cfg

# Create vault password (DO NOT commit this file!)
openssl rand -base64 32 > ~/.vault_pass
chmod 600 ~/.vault_pass
```

---

## Key Settings

| Parameter | Value |
|---|---|
| `nocows` | 1 |
| `gathering` | smart |
| `fact_caching_timeout` | 7200 |
| `forks` | 20 |
| `timeout` | 60 |
| `transport` | ssh |
| `pipelining` | True |
| `vault_password_file` | `~/.vault_pass` |
| `inventory` | `inventory` (relative to ~/.ansible) |
| `roles_path` | `roles/vendor` |

### Environment Variables

```bash
export ANSIBLE_VAULT_PASSWORD_FILE=~/.vault_pass
export ANSIBLE_LOG_PATH=~/.ansible/ansible.log
export ANSIBLE_STDOUT_CALLBACK='yaml'
export ANSIBLE_STRATEGY_PLUGINS=~/.ansible/plugins/mitogen
export ANSIBLE_CONFIG=~/.ansible/ansible.cfg
```

---

## Dependencies

| Dependency | Purpose |
|---|---|
| mitogen | Strategy plugin for Ansible acceleration |
| vault_pass | Password file for ansible-vault |

---

## Troubleshooting

### MITOGEN not loading

```bash
# Make sure mitogen is installed
mkdir -p ~/.ansible/plugins/mitogen
# Download mitogen to this path
```

### Vault password not found

```bash
# Create the file
openssl rand -base64 32 > ~/.vault_pass
chmod 600 ~/.vault_pass
```
