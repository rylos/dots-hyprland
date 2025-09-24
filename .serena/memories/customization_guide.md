# Guida alla customizzazione

## Cartella custom
Il progetto prevede la customizzazione attraverso la cartella `.config/hypr/custom/` che contiene:

- `env.conf`: Variabili d'ambiente personalizzate
- `execs.conf`: Comandi da eseguire all'avvio
- `general.conf`: Configurazioni generali (layout tastiera, input, ecc.)
- `keybinds.conf`: Keybind personalizzati
- `rules.conf`: Regole per finestre e applicazioni
- `scripts/`: Script personalizzati

## Configurazione layout tastiera
Per impostare il layout italiano:

```bash
# In .config/hypr/custom/general.conf
input {
    kb_layout = it
}
```

## Come applicare le modifiche
```bash
# Ricarica configurazione Hyprland
hyprctl reload
```

## Struttura override
I file in `custom/` sovrascrivono quelli in `hyprland/` grazie all'ordine di caricamento nel file principale `hyprland.conf`:

1. Prima vengono caricati i default da `hyprland/`
2. Poi vengono caricati i custom da `custom/`

## Best practices
- Non modificare mai i file in `hyprland/` (vengono sovrascritti dagli aggiornamenti)
- Usare sempre i file in `custom/` per le personalizzazioni
- Testare le modifiche con `hyprctl reload` prima di riavviare