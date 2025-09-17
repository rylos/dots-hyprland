# Comportamento Script di Installazione

## Funzione v() - Conferma Comandi
La funzione `v()` in `scriptdata/functions` gestisce l'esecuzione con conferma quando `$ask=true`:

### Opzioni disponibili:
- **y** = Yes (esegui comando)
- **e** = Exit now (esci dallo script)
- **s** = Skip (salta comando - NON raccomandato)
- **yesforall** = Yes e non chiedere più (NON raccomandato)

## Sezioni di Sovrascrittura .config/

### MISC Section (loop rsync) - MODIFICATA
```bash
for i in $(find .config/ -mindepth 1 -maxdepth 1 ! -name 'fish' ! -name 'hypr' ! -name 'kitty' ! -name 'nvim' ! -name 'mpv' ! -name 'zshrc.d' ! -name 'dolphinrc' ! -name 'kdeglobals' ! -name 'konsolerc' ! -name 'chrome-flags.conf' ! -name 'code-flags.conf' ! -name 'starship.toml' -exec basename {} \;); do
  if [ -d ".config/$i" ];then v rsync -av --delete ".config/$i/" "$XDG_CONFIG_HOME/$i/"
  elif [ -f ".config/$i" ];then v rsync -av ".config/$i" "$XDG_CONFIG_HOME/$i"
  fi
done
```

**Comportamento**: `v()` chiede conferma **individualmente per ogni directory/file** trovato in `.config/` (con esclusioni personalizzate).

**Directory che VERRANNO installate**: 
- quickshell (interfaccia widget - ESSENZIALE)
- fontconfig (font progetto - ESSENZIALE per aspetto corretto)
- Kvantum, qt5ct, qt6ct (temi Qt)
- fuzzel (launcher)
- wlogout (menu logout)
- fcitx5 (input method)
- foot (terminale alternativo)
- matugen (generatore colori)
- xdg-desktop-portal (portali desktop)
- kde-material-you-colors (temi KDE)

**Directory ESCLUSE (mantieni configurazioni esistenti)**:
- kitty (terminale)
- nvim (editor)
- mpv (media player)
- zshrc.d (configurazioni zsh)
- dolphinrc, kdeglobals, konsolerc (configurazioni KDE)
- chrome-flags.conf, code-flags.conf (flag browser/editor)
- starship.toml (prompt shell)

### FISH Section
```bash
v rsync -av --delete .config/fish/ "$XDG_CONFIG_HOME"/fish/
```
**Comportamento**: Una singola conferma per tutta la configurazione Fish.

### HYPRLAND Section
```bash
v rsync -av --delete --exclude '/custom' --exclude '/hyprlock.conf' --exclude '/hypridle.conf' --exclude '/hyprland.conf' .config/hypr/ "$XDG_CONFIG_HOME"/hypr/
```
**Comportamento**: Una singola conferma per configurazioni Hyprland (esclusi file gestiti separatamente).

## Conseguenze Skip (s)
Se si salta una sezione:
- **MISC**: Interfaccia Quickshell, temi, colori, font non funzionano
- **FISH**: Shell non configurata
- **HYPRLAND**: Compositor non configurato correttamente

## Controllo Esistenti
Lo script già gestisce file esistenti:
- **hyprland.conf**: Rinomina in .old se primo run, altrimenti non sovrascrive
- **hypridle.conf/hyprlock.conf**: Crea .new se esistono
- **custom/**: Non sovrascrive se esiste

## Font del Progetto
Con fontconfig incluso, verranno installati i font specifici:
- Rubik (interfaccia principale)
- Gabarito (titoli)
- JetBrains Mono NF (monospace/icone)
- Material Symbols Rounded (icone)
- Readex Pro (lettura)
- Space Grotesk (espressivo)

Questo garantisce che l'interfaccia Quickshell appaia identica alle screenshot originali.