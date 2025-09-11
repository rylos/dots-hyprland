# Progetto: end_4's Hyprland dotfiles

## Scopo del progetto
Dotfiles per Hyprland con tema "illogical-impulse" che fornisce:
- Desktop environment completo basato su Hyprland (compositor Wayland)
- Sistema di widget con Quickshell (QtQuick-based)
- Generazione automatica di colori Material Design basati su wallpaper
- Integrazione AI (Gemini API e modelli Ollama)
- Overview delle app con anteprime live
- Installazione trasparente con conferma comandi

## Tech Stack
- **Compositor**: Hyprland (Wayland)
- **Widget System**: Quickshell (QtQuick/QML)
- **Shell**: Bash per script di installazione/gestione
- **Linguaggi**: QML per interfaccia, Bash per automazione
- **Sistema**: Arch Linux e derivate
- **Dipendenze**: Gestite tramite meta-package PKGBUILD

## Struttura del codebase
- `.config/`: Configurazioni applicazioni (hypr, quickshell, ecc.)
- `arch-packages/`: Meta-package PKGBUILD per dipendenze
- `scriptdata/`: Script e configurazioni per installazione
- `install.sh`: Script principale installazione
- `update.sh`: Script aggiornamento dotfiles
- `uninstall.sh`: Script disinstallazione
- `.config/quickshell/ii/`: Codice QML per interfaccia widget

## Modifiche recenti aggiunte
- **Configurazione Neovim**: LazyVim con integrazione Amazon Q
- **Layout tastiera**: Impostato su italiano (it)
- **Traduzioni**: Stringhe hardcoded convertite in Translation.tr()
- **Configurazione Kitty**: Aggiornata con features avanzate (mantenendo font/colori progetto)
- **Sistema backup**: Script automatico per backup configurazioni esistenti
- **Documentazione**: KEYBINDINGS.md e BACKUP-INFO.md aggiunti

## Font utilizzati
- **Principale**: Rubik (interfaccia)
- **Titoli**: Gabarito
- **Monospace**: JetBrains Mono Nerd Font
- **Icone**: Material Symbols Rounded
- **Lettura**: Readex Pro
- **Espressivo**: Space Grotesk

## Localizzazione
- Supporto multilingua con Translation.qml
- File traduzioni in `translations/it_IT.json`
- Configurazione automatica basata su locale sistema