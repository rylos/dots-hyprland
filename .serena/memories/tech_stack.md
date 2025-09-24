# Tech Stack

## Componenti principali
- **Hyprland**: Compositor Wayland per la gestione delle finestre
- **Quickshell**: Sistema di widget basato su QtQuick per barre di stato, sidebar, ecc.
- **QML**: Linguaggio per l'interfaccia utente (QtQuick)
- **Bash**: Script di installazione e utilità
- **Python**: Dipendenze per alcuni moduli

## Dipendenze chiave
- `quickshell-git`: Versione di sviluppo di Quickshell
- `hyprland`: Compositor principale
- Pacchetti Arch Linux organizzati in gruppi:
  - `illogical-impulse-basic`: Dipendenze base (curl, jq, meson, ecc.)
  - `illogical-impulse-hyprland`: Specifiche per Hyprland
  - `illogical-impulse-widgets`: Per i widget
  - `illogical-impulse-fonts-themes`: Font e temi

## Struttura file
- `.config/hypr/`: Configurazioni Hyprland
- `.config/quickshell/ii/`: Codice QML per i widget
- `arch-packages/`: Definizioni pacchetti PKGBUILD
- `scriptdata/`: Funzioni e variabili per gli script
- Script principali: `install.sh`, `update.sh`, `uninstall.sh`