#!/bin/sh

set -eu

ARCH=$(uname -m)

echo "Installing package dependencies..."
echo "---------------------------------------------------------------"
if [ "$ARCH" = "aarch64" ]; then
    wget https://umea.mirror.pkgbuild.com/extra/os/x86_64/edk2-ovmf-202508-1-any.pkg.tar.zst
    wget https://umea.mirror.pkgbuild.com/extra/os/x86_64/seabios-1.17.0-2-any.pkg.tar.zst
    pacman -U seabios-*.pkg.tar.zst edk2-ovmf-*.pkg.tar.zst --noconfirm
fi
pacman -Syu --noconfirm --overwrite '/usr/share/qemu/*' \
    gtk3                     \
    libdecor                 \
    pipewire-audio           \
    pipewire-jack            \
    qemu-audio-pa            \
    qemu-block-curl          \
    qemu-block-dmg           \
    qemu-block-gluster       \
    qemu-block-iscsi         \
    qemu-block-nfs           \
    qemu-block-ssh           \
    qemu-img                 \
    qemu-system-x86          \
    qemu-system-x86-firmware \
    qemu-ui-gtk              \
    qemu-user                \
    qemu-user-binfmt         \
    sdl2

echo "Installing debloated packages..."
echo "---------------------------------------------------------------"
get-debloated-pkgs --add-common --prefer-nano

# Comment this out if you need an AUR package
#make-aur-package PACKAGENAME

# If the application needs to be manually built that has to be done down here
#mkdir -p ./AppDir/bin
#cp /usr/share/qemu/* ./AppDir/bin
