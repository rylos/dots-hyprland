# Sistema di Backup e Sicurezza

## Script di backup automatico
- **File**: `backup-configs.sh`
- **Funzione**: Backup automatico configurazioni esistenti prima installazione
- **Features**:
  - Rilevamento automatico configurazioni da salvare
  - Timestamp unico per ogni backup
  - Generazione script ripristino personalizzato
  - Feedback colorato e dettagliato

## Configurazioni che vengono sovrascritte
### Directory:
- fish, fontconfig, kitty, mpv, nvim
- fcitx5, foot, fuzzel, Kvantum
- qt5ct, qt6ct, wlogout, xdg-desktop-portal
- kde-material-you-colors, matugen, quickshell, zshrc.d

### File singoli:
- dolphinrc, kdeglobals, konsolerc
- starship.toml, darklyrc
- chrome-flags.conf, code-flags.conf, thorium-flags.conf

## Script di ripristino
- **Generato automaticamente** per ogni backup
- **Modalità**: interattiva, completa, selettiva
- **Controlli sicurezza**: verifica esistenza file
- **Help integrato**: documentazione completa

## Documentazione
- **BACKUP-INFO.md**: Guida completa backup/ripristino
- **KEYBINDINGS.md**: Lista completa keybind Hyprland
- File informativi generati automaticamente in ogni backup

## Sicurezza installazione
- Lo script `install.sh` NON sovrascrive `.zshrc` (solo aggiunge source)
- Backup automatico prima di ogni sovrascrittura
- Conferma utente per ogni operazione (modalità ask)
- Gestione separata per configurazioni Hyprland esistenti