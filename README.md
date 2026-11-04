# workstation

Personal Fedora GNOME workstation setup for software development and research on 64-bit x86.

## Fedora pre-installation

Ansible uses `python3-libdnf5` to manage system packages, including in check mode.

```bash
# Step -- 1.
sudo dnf upgrade --refresh --assumeyes

# Step -- 2.
sudo dnf install --assumeyes git python3 python3-pip python3-libdnf5
```

## Installation

Run from your GNOME session as your regular user.
The playbook asks for your login password before running tasks.

```bash
# Step -- 1.
git clone --depth=1 --branch=fedora https://github.com/vladpunko/workstation.git

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
ansible-playbook --ask-become-pass --inventory=hosts workstation.yml

# Step -- 8.
cd ..
```

## Git Hooks

```bash
# Step -- 1.
python3 -m pip install pre-commit

# Step -- 2.
pre-commit install
```

Sign out and back in to apply the login shell and Docker group membership.

## Firmware

```bash
# Step -- 1.
sudo fwupdmgr refresh --force
sudo fwupdmgr update --assume-yes

# Step -- 2.
sudo dnf swap ffmpeg-free ffmpeg --allowerasing

# Step -- 3.
sudo dnf group install --with-optional multimedia

# Step -- 4.
# Install these drivers only for an NVIDIA GPU.
sudo dnf install --assumeyes akmod-nvidia xorg-x11-drv-nvidia xorg-x11-drv-nvidia-cuda

# Step -- 5.
sudo dnf update --refresh --assumeyes
sudo reboot
```

## License

[MIT](https://choosealicense.com/licenses/mit)
