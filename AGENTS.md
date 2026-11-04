This repository contains an Ansible playbook for configuring macOS on my local MacBook for work and research.

# Rules

- Avoid unnecessary wrappers, abstractions, and duplicated logic.
- Choose the simplest solution that meets the task.
- Keep code readable and follow the existing style throughout the repository.
- Keep paths, versions, dependencies, and settings consistent across all configurations.
- Keep shell scripts consistent in structure, formatting, and error handling.
- Use `[[ ... ]]` for shell conditions.
- Write one command per line. Put `then` and `do` on their own lines.
- Keep the playbook, scripts, and README synchronized.
- Write short, simple comments that explain why.
- Write comments as simple sentences without semicolons.
- Use backticks for literal code references, including commands, variables, configuration keys, paths, filenames, extensions, flags, and values.

# Checks

For testing shell scripts, run from the repository root:

```bash
shellcheck macos.defaults playbook/files/scripts/*
```

Check shell configuration separately with `zsh -n`, including `.zsh` files and startup files without that extension.

For testing the Ansible playbook, run from `playbook/`:

```bash
ansible-lint
ansible-playbook --syntax-check workstation.yml
ansible-playbook --check workstation.yml
```
