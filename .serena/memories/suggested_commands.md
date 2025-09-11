# Comandi suggeriti per dots-hyprland

## Installazione e setup
```bash
# Installazione completa (solo Arch Linux)
./install.sh

# Installazione manuale helper
./manual-install-helper.sh

# Disinstallazione
./uninstall.sh

# Aggiornamento dotfiles
./update.sh
```

## Sviluppo Quickshell
```bash
# Avvio shell per sviluppo (con log)
pkill qs; qs -c ii

# Setup LSP per Quickshell
touch ~/.config/quickshell/ii/.qmlls.ini

# Formattazione QML (se disponibile)
qmlformat -i file.qml
```

## Gestione dipendenze
```bash
# Controllo dipendenze
./scriptdata/checkdeps.sh

# Installazione pacchetti Arch
yay -S hyprland quickshell-git

# Build meta-packages
cd arch-packages/illogical-impulse-basic && makepkg -si
```

## Debug e diagnostica
```bash
# Diagnosi sistema
./diagnose

# Log Hyprland
hyprctl logs

# Restart Quickshell
pkill qs && qs -c ii
```

## Comandi sistema Linux
```bash
# File operations
ls -la, find, grep, ripgrep
cd, pwd, mkdir, rm, cp, mv

# Git operations
git pull, git status, git add, git commit

# Package management (Arch)
pacman -S, yay -S, makepkg -si
```