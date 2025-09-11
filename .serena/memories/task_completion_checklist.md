# Cosa fare dopo completamento task

## Testing e validazione
1. **Test installazione**: Verificare che `./install.sh` funzioni correttamente
2. **Test Quickshell**: Avviare `qs -c ii` e verificare che non ci siano errori
3. **Test configurazioni**: Verificare che le configurazioni Hyprland siano valide
4. **Test dipendenze**: Eseguire `./scriptdata/checkdeps.sh`

## Formattazione e linting
1. **QML**: Usare `qmlformat` se disponibile sui file modificati
2. **Bash**: Verificare sintassi con `bash -n script.sh`
3. **Controllo stile**: Rispettare le convenzioni in `.qmlformat.ini`

## Documentazione
1. **README**: Aggiornare se necessario per nuove funzionalità
2. **CONTRIBUTING**: Seguire le linee guida per contribuzioni
3. **Commenti**: Documentare codice complesso, specialmente in QML

## Git workflow
1. **Commit**: Messaggi descrittivi e atomici
2. **Branch**: Usare feature branch per modifiche significative
3. **PR**: Seguire template se disponibile

## Deployment
1. **Backup**: Script di installazione crea backup automatici
2. **Update**: Usare `./update.sh` per aggiornamenti incrementali
3. **Rollback**: Procedure di ripristino disponibili tramite backup

## Monitoring
1. **Log**: Controllare log Hyprland e Quickshell per errori
2. **Performance**: Verificare uso memoria/CPU dopo modifiche
3. **Compatibilità**: Testare su Arch Linux e derivate