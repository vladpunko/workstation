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
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/opt/homebrew/bin/brew shellenv)"

# Step -- 4.
brew install python@3.13
```

## Installation

```bash
# Step -- 1.
git clone --depth=1 --branch=macos https://github.com/vladpunko/workstation.git

# Step -- 2.
cd ./workstation

# Step -- 3.
/opt/homebrew/bin/python3.13 -m venv ./playbook/.venv

# Step -- 4.
source ./playbook/.venv/bin/activate

# Step -- 5.
python3 -m pip install --requirement=./playbook/requirements.txt

# Step -- 6.
cd ./playbook

# Step -- 7.
ansible-playbook workstation.yml

# Step -- 8.
cd ..

# Step -- 9.
bash ./macos.defaults
```

## Git Hooks

```bash
# Step -- 1.
python3 -m pip install pre-commit

# Step -- 2.
pre-commit install
```

## License

[MIT](https://choosealicense.com/licenses/mit)
