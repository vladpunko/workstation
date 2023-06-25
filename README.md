# workstation

```bash
echo "${HOME} sweet ${HOME}"
```

## Installation

```bash
# Step -- 1.
git clone --depth=1 --branch=master https://github.com/vladpunko/workstation.git

# Step -- 2.
cd ./workstation/playbook

# Step -- 3.
python3 -m venv .venv && source ./.venv/bin/activate

# Step -- 4.
python3 -m pip install --requirement=requirements.txt

# Step -- 5.
ansible-playbook --ask-become-pass --inventory=hosts workstation.yml
```

## Firmware

```bash
# Step -- 1.
sudo sh -c 'fwupdmgr refresh --force && fwupdmgr update --assume-yes'

# Step -- 2.
sudo dnf swap ffmpeg-free ffmpeg --allowerasing

# Step -- 3.
sudo dnf group install --with-optional Multimedia
```

## License

[MIT](https://choosealicense.com/licenses/mit)
