# Struttura del codebase

## Directory principali
```
dots-hyprland/
├── .config/                    # Configurazioni applicazioni
│   ├── hypr/                  # Configurazioni Hyprland
│   │   ├── hyprland.conf      # Config principale
│   │   ├── monitors.conf      # Setup monitor
│   │   └── workspaces.conf    # Configurazione workspace
│   ├── quickshell/ii/         # Codice widget Quickshell
│   │   ├── shell.qml          # Entry point principale
│   │   ├── modules/           # Moduli widget
│   │   ├── services/          # Servizi backend
│   │   └── scripts/           # Script utility
│   ├── kitty/                 # Terminale
│   ├── fuzzel/                # Launcher
│   └── ...                    # Altre app
├── arch-packages/             # Definizioni pacchetti Arch
├── scriptdata/                # Funzioni e variabili script
├── install.sh                 # Script installazione principale
├── update.sh                  # Script aggiornamento
└── uninstall.sh              # Script disinstallazione
```

## Moduli Quickshell principali
- `modules/bar/`: Barra superiore
- `modules/overview/`: Launcher/overview applicazioni
- `modules/sidebarLeft/`: Sidebar sinistra
- `modules/sidebarRight/`: Sidebar destra
- `modules/dock/`: Dock applicazioni
- `modules/notificationPopup/`: Notifiche
- `modules/mediaControls/`: Controlli media
- `modules/wallpaperSelector/`: Selettore wallpaper

## File chiave
- `shell.qml`: Entry point Quickshell
- `GlobalStates.qml`: Stati globali condivisi
- `settings.qml`: Configurazioni utente
- `hyprland.conf`: Configurazione principale Hyprland