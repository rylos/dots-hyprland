# Task completion checklist

## Dopo modifiche al codice QML
1. **Test live reload**: Le modifiche dovrebbero essere visibili immediatamente
2. **Verifica sintassi**: Controllare che non ci siano errori QML nei log
3. **Test funzionalità**: Verificare che i widget funzionino correttamente
4. **Riavvio shell se necessario**: `pkill qs; qs -c ii`

## Dopo modifiche agli script
1. **Test permessi**: Verificare che gli script siano eseguibili
2. **Test su sistema pulito**: Preferibilmente testare l'installazione
3. **Verifica dipendenze**: Controllare che tutti i pacchetti siano disponibili
4. **Test modalità interattiva**: Provare con conferma comandi attiva

## Dopo modifiche alle configurazioni
1. **Backup**: Creare backup delle configurazioni esistenti
2. **Test Hyprland**: `hyprctl reload` per ricaricare la configurazione
3. **Verifica keybind**: Testare le scorciatoie da tastiera
4. **Test multi-monitor**: Se applicabile

## Prima del commit
1. **Formattazione**: Eseguire formatter QML se disponibile
2. **Pulizia**: Rimuovere file temporanei e log
3. **Test completo**: Verificare che tutto funzioni
4. **Documentazione**: Aggiornare README se necessario

## Release checklist
1. **Test installazione**: Su sistema Arch pulito
2. **Verifica dipendenze**: Tutti i pacchetti in arch-packages/
3. **Test disinstallazione**: Verificare che `uninstall.sh` funzioni
4. **Aggiornamento wiki**: Se ci sono nuove funzionalità