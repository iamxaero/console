# Bash Configuration

> Basic bash configuration for the DevOps environment.

---

## Installation

```bash
# Symlink
ln -sf $(pwd)/console/shell/bash/.bashrc ~/.bashrc
```

---

## Key Settings

- PATH settings
- Ansible environment variables
- Python aliases (uv)
- SSH setup
- Git aliases

---

## Dependencies

| Dependency | Purpose |
|---|---|
| powerline-shell | Powerline prompt for bash (optional) |
| uv | Python version management |

---

## Troubleshooting

### Aliases not working

```bash
# Make sure .bashrc is symlinked
ls -la ~/.bashrc

# If not — recreate the symlink
ln -sf $(pwd)/console/shell/bash/.bashrc ~/.bashrc
```

### SSH not adding keys

```bash
# Check that keys exist
ls -la ~/.ssh/id_ed25519 ~/.ssh/id_rsa 2>/dev/null
```
