#!/bin/sh

set -eu

if [ "$(id -u)" != 0 ] && sudo --preserve-env --non-interactive true; then
  echo >&2 "sudo already configured"
  exit 0
fi

useradd --user-group build

echo 'build ALL=(ALL) NOPASSWD: ALL' >/etc/sudoers.d/build
chmod 440 /etc/sudoers.d/build
visudo --check
