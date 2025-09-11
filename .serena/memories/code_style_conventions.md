# Stile e convenzioni di codice

## QML (Quickshell)
- **Indentazione**: 4 spazi (no tab)
- **Larghezza massima**: 110 caratteri
- **Newline**: Unix style
- **Spacing**: Oggetti con spaziatura, funzioni senza
- **Ordine**: Non normalizzato
- **File config**: `.qmlformat.ini` nella root del progetto Quickshell

## Bash Scripts
- **Shebang**: `#!/usr/bin/env bash`
- **Set options**: `set -uo pipefail` per safety
- **Variabili**: MAIUSCOLE per costanti, lowercase per variabili locali
- **Colori**: Definiti come costanti (RED, GREEN, YELLOW, etc.)
- **Funzioni**: snake_case
- **Commenti**: Documentazione estesa per script principali

## Struttura file
- **Configurazioni**: Separate per categoria in `.config/`
- **Script**: Modulari in `scriptdata/`
- **Dipendenze**: Meta-package PKGBUILD in `arch-packages/`
- **Assets**: In cartelle dedicate (`assets/`, `.github/assets/`)

## Naming conventions
- **File QML**: PascalCase (es. `GlobalStates.qml`)
- **Script bash**: lowercase con trattini (es. `install.sh`)
- **Directory**: lowercase con trattini
- **Variabili QML**: camelCase
- **Variabili bash**: snake_case