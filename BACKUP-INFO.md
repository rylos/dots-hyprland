# Backup delle Configurazioni

## ⚠️ IMPORTANTE: File che vengono sovrascritti durante l'installazione

Lo script di installazione `install.sh` **sovrascrive completamente** alcune configurazioni esistenti usando `rsync -av --delete`.

### Directory che vengono sovrascritte:
- **`~/.config/fish/`** - Configurazione shell Fish
- **`~/.config/fontconfig/`** - Configurazione font di sistema
- **`~/.config/kitty/`** - Configurazione terminale Kitty
- **`~/.config/mpv/`** - Configurazione player MPV
- **`~/.config/nvim/`** - Configurazione editor Neovim
- **`~/.config/fcitx5/`** - Input method (se presente)
- **`~/.config/foot/`** - Terminale Foot (se presente)
- **`~/.config/fuzzel/`** - Launcher Fuzzel (se presente)
- **`~/.config/Kvantum/`** - Temi Qt (se presente)
- **`~/.config/qt5ct/`** e **`~/.config/qt6ct/`** - Configurazioni Qt
- **`~/.config/wlogout/`** - Menu logout
- **`~/.config/xdg-desktop-portal/`** - Portal desktop

### File singoli che vengono sovrascritti:
- **`~/.config/dolphinrc`** - Impostazioni file manager Dolphin
- **`~/.config/kdeglobals`** - Impostazioni globali KDE
- **`~/.config/konsolerc`** - Impostazioni terminale Konsole
- **`~/.config/starship.toml`** - Configurazione prompt Starship
- **`~/.config/darklyrc`** - Tema Darkly
- **`~/.config/chrome-flags.conf`** - Flag Chrome
- **`~/.config/code-flags.conf`** - Flag VS Code
- **`~/.config/thorium-flags.conf`** - Flag Thorium

### File che NON vengono toccati:
- **`~/.zshrc`** ✅ - Viene solo aggiunta una riga per il source
- **`~/.bashrc`** ✅ - Non modificato
- **`~/.profile`** ✅ - Non modificato

## 📦 Backup automatico creato

**Data backup**: 2025-09-11 09:39:03  
**Percorso**: `~/.config-backup-20250911-093903/`

### Contenuto del backup:
```
~/.config-backup-20250911-093903/
├── fish/           # Configurazione Fish shell
├── fontconfig/     # Configurazione font
├── kitty/          # Configurazione Kitty
├── mpv/            # Configurazione MPV
├── nvim/           # Configurazione Neovim
├── dolphinrc       # Impostazioni Dolphin
├── kdeglobals      # Impostazioni KDE
└── konsolerc       # Impostazioni Konsole
```

## 🔄 Come ripristinare le configurazioni originali

Se vuoi tornare alle tue configurazioni precedenti:

```bash
# Ripristina una directory specifica
cp -r ~/.config-backup-20250911-093903/kitty ~/.config/

# Ripristina un file specifico
cp ~/.config-backup-20250911-093903/kdeglobals ~/.config/

# Ripristina tutto (ATTENZIONE: rimuove le configurazioni dei dotfiles)
rm -rf ~/.config/fish ~/.config/kitty ~/.config/nvim ~/.config/mpv ~/.config/fontconfig
cp -r ~/.config-backup-20250911-093903/* ~/.config/
```

## 📝 Note

- Il backup viene creato automaticamente prima dell'installazione
- Ogni backup ha un timestamp unico per evitare sovrascritture
- Le configurazioni Hyprland vengono gestite diversamente (backup con estensione `.old` o `.new`)
- I file di configurazione personalizzati in `~/.config/hypr/custom/` NON vengono mai sovrascritti

## 🔧 Script di Backup Automatico

Il progetto include uno script per creare automaticamente il backup:

```bash
# Esegui backup prima dell'installazione
./backup-configs.sh
```

Lo script:
- ✅ Rileva automaticamente le configurazioni esistenti
- ✅ Crea backup con timestamp unico
- ✅ Genera script di ripristino personalizzato
- ✅ Fornisce feedback dettagliato
- ✅ Crea file informativi

## 🚨 Raccomandazioni

1. **Controlla il backup** prima di procedere con l'installazione
2. **Annota le personalizzazioni** importanti delle tue configurazioni
3. **Testa le nuove configurazioni** prima di eliminare i backup
4. **Mantieni i backup** per almeno qualche settimana dopo l'installazione