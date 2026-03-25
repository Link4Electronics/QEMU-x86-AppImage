#!/bin/sh

set -eu

ARCH=$(uname -m)

echo "Installing package dependencies..."
echo "---------------------------------------------------------------"
pacman -Syu --noconfirm      \
    edk2-ovmf                \
    gtk3                     \
    libdecor                 \
    qemu-audio-pa            \
    qemu-system-x86          \
    qemu-system-x86-firmware \
    qemu-ui-gtk              \
    sdl2                     \
    seabios

echo "Installing debloated packages..."
echo "---------------------------------------------------------------"
get-debloated-pkgs --add-common --prefer-nano

# Comment this out if you need an AUR package
#make-aur-package PACKAGENAME

# If the application needs to be manually built that has to be done down here
mkdir -p ./AppDir/bin
#cp /usr/share/qemu/* ./AppDir/bin
