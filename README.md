# workstation

Personal macOS workstation bootstrap, dotfiles, and local provisioning playbook.

## macOS pre-installation

```bash
# Step -- 1.
sudo softwareupdate --all --install

# Step -- 2.
xcode-select --install
xcode-select --print-path

# Step -- 3.
/bin/bash -c "$(curl -sSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

## Installation

```bash
# Step -- 1.
git clone --depth=1 --branch=master https://github.com/vladpunko/workstation.git

# Step -- 2.
cd ./workstation

# Step -- 3.
python3 -m venv ./playbook/.venv

# Step -- 4.
source ./playbook/.venv/bin/activate

# Step -- 5.
python3 -m pip install --requirement=./playbook/requirements.txt

# Step -- 6.
cd ./playbook

# Step -- 7.
ansible-playbook --ask-become-pass workstation.yml

# Step -- 8.
cd ..

# Step -- 9.
sh ./macos.defaults
```

## Git Hooks

```bash
python3 -m pip install pre-commit
pre-commit install
```

## License

[MIT](https://choosealicense.com/licenses/mit)
