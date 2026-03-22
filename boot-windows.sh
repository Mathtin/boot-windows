#!/usr/bin/env bash

set -euo pipefail

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

WIN_LINE=$(efibootmgr | grep -i "Windows Boot Manager" || true)

if [[ -z "$WIN_LINE" ]]; then
  echo "Windows Boot Manager entry not found."
  exit 1
fi

WIN_BOOTNUM=$(echo "$WIN_LINE" | sed -E 's/^Boot([0-9A-Fa-f]{4}).*/\1/' | head -n1)

if [[ -z "$WIN_BOOTNUM" ]]; then
  echo "Failed to parse boot number."
  exit 1
fi

echo "Found Windows Boot Manager at Boot$WIN_BOOTNUM"
echo "Preparing for jump"
read -p "Are you sure? (Y/y): " -n 1 -r
echo

if [[ $REPLY =~ ^[Yy]$ ]]; then
    #echo "User agreed"
    true
else
    echo "Skipped booting windows"
    exit
fi

echo "Setting windows as one-time boot"
efibootmgr -n "$WIN_BOOTNUM"

read -p "Press any key to reboot" -n 1 -r
echo "Rebooting"
reboot
