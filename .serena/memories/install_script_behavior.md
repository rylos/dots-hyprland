# Comportamento Script di Installazione

## Funzione v() - Conferma Comandi
La funzione `v()` in `scriptdata/functions` gestisce l'esecuzione con conferma quando `$ask=true`:

### Opzioni disponibili:
- **y** = Yes (esegui comando)
- **e** = Exit now (esci dallo script)
- **s** = Skip (salta comando - NON raccomandato)
- **yesforall** = Yes e non chiedere più (NON raccomandato)

## Sezioni di Sovrascrittura .config/

### MISC Section (loop rsync)
```bash
for i in $(find .config/ -mindepth 1 -maxdepth 1 ! -name 'fish' ! -name 'hypr' -exec basename {} \;); do
  if [ -d ".config/$i" ];then v rsync -av --delete ".config/$i/" "$XDG_CONFIG_HOME/$i/"
  elif [ -f ".config/$i" ];then v rsync -av ".config/$i" "$XDG_CONFIG_HOME/$i"
  fi
done
```

**Comportamento**: `v()` chiede conferma **individualmente per ogni directory/file** trovato in `.config/` (esclusi fish e hypr).

**Directory tipiche**: kitty, nvim, quickshell, fontconfig, mpv, fcitx5, foot, fuzzel, Kvantum, qt5ct, qt6ct, wlogout, xdg-desktop-portal, kde-material-you-colors, matugen, zshrc.d

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
- **MISC**: Interfaccia Quickshell, temi, colori non funzionano
- **FISH**: Shell non configurata
- **HYPRLAND**: Compositor non configurato correttamente

## Controllo Esistenti
Lo script già gestisce file esistenti:
- **hyprland.conf**: Rinomina in .old se primo run, altrimenti non sovrascrive
- **hypridle.conf/hyprlock.conf**: Crea .new se esistono
- **custom/**: Non sovrascrive se esiste