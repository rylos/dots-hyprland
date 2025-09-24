# Comandi suggeriti

## Installazione
```bash
# Installazione completa (solo Arch Linux)
./install.sh

# Installazione manuale assistita
./manual-install-helper.sh

# Aggiornamento
./update.sh

# Disinstallazione
./uninstall.sh
```

## Sviluppo Quickshell
```bash
# Avviare la shell in modalità debug
pkill qs; qs -c ii

# Setup LSP per QML
touch ~/.config/quickshell/ii/.qmlls.ini

# Riavvio rapido della shell
pkill qs && qs -c ii
```

## Customizzazione
```bash
# Applicare modifiche configurazione Hyprland
hyprctl reload

# Editare configurazioni custom
nano ~/.config/hypr/custom/general.conf
nano ~/.config/hypr/custom/keybinds.conf

# Verificare configurazione attiva
hyprctl getoption input:kb_layout
```

## Sviluppo e debug
```bash
# Controllo dipendenze
./scriptdata/checkdeps.sh

# Diagnosi sistema
./diagnose

# Visualizzare log Hyprland
journalctl -f -u hyprland

# Test configurazione Hyprland
hyprctl reload
```

## Comandi sistema Linux
```bash
# Gestione file
ls -la
find . -name "*.qml"
grep -r "pattern" .config/
cd ~/.config/quickshell/ii

# Git
git status
git add .
git commit -m "message"
git push origin main
```

## Keybind importanti
- `Super + /`: Lista keybind
- `Super + Enter`: Terminale
- `Super + Space`: Overview/launcher