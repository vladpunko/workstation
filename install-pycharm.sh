#!/usr/bin/env sh

# Copyright 2020 (c) Vladislav Punko <iam.vlad.punko@gmail.com>

set -o errexit
set -o nounset

# Exit if this script is run as the superuser.
if [ "$(id -u)" -ne 0 ]; then
  echo 'This program needs to be run as a superuser on the current operating system.' >&2
  # Stop this program runtime and return the exit status code.
  exit 13
fi

version=2023.2.2

pycharm_archive=/tmp/pycharm.tar.gz
# Use this reserved directory to install additional software packages.
# See information: https://stackoverflow.com/questions/12649355
pycharm_path=/opt/pycharm

pycharm_program=/usr/bin/pycharm

_cleanup() {
  rm -f -r -- "${pycharm_archive}"
}
trap _cleanup 0 1 2 3 6

# Download pycharm archive containing all editor's components to the current working machine.
wget --continue -O "${pycharm_archive}" "https://download.jetbrains.com/python/pycharm-community-${version}.tar.gz"

mkdir --parents -- "${pycharm_path}"
# Extract all files from the downloaded archive and save them in the destination path on the current machine.
tar --gzip --overwrite --strip-components=1 -x -f "${pycharm_archive}" -C "${pycharm_path}"

if [ -L "${pycharm_program}" ] && [ -e "${pycharm_program}" ]; then
  # Get rid of the existing symlink that points to the now-obsolete version.
  rm -f -- "${pycharm_program}"
fi

# Create a new user's working link to the main shell script to start this editor on the command line.
ln -s -- "${pycharm_path}/bin/pycharm.sh" "${pycharm_program}"
