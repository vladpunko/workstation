# workstation

"${HOME}" sweet "${HOME}"

## Installation

```bash
# Step -- 1.
git clone --depth=1 --branch=master https://github.com/vladpunko/workstation.git

# Step -- 2.
cd ./workstation/

# Step -- 3.
python3 -m pip install --user --requirement=requirements.txt

# Step -- 4.
ansible-playbook --ask-become-pass --inventory=hosts workstation.yml
```

## Firmware

```bash
# Step -- 1.
sudo sh -c 'fwupdmgr refresh --force && fwupdmgr update --assume-yes'

# Step -- 2.
sudo dnf install --assumeyes akmod-nvidia xorg-x11-drv-nvidia xorg-x11-drv-nvidia-cuda

# Step -- 3.
sudo dnf update --refresh --assumeyes && reboot
```

## License

[MIT](https://choosealicense.com/licenses/mit)
