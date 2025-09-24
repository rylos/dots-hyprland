# Stile e convenzioni

## Codice QML
- **File**: Estensione `.qml`
- **Formattazione**: Configurazione in `.qmlformat.ini`
- **Struttura**: Moduli organizzati in cartelle (`modules/bar/`, `modules/overview/`, ecc.)
- **Imports**: QtQuick, Quickshell, moduli locali
- **Naming**: CamelCase per componenti, camelCase per proprietà

## Script Bash
- **Shebang**: `#!/usr/bin/env bash`
- **Funzioni**: Definite in `scriptdata/functions`
- **Variabili**: XDG standard in `scriptdata/environment-variables`
- **Conferma comandi**: Funzione `v()` per esecuzione interattiva
- **Gestione errori**: Funzione `x()` con retry automatico

## Organizzazione file
- **Configurazioni**: `.config/` (seguono XDG Base Directory)
- **Script**: Root del progetto e `scriptdata/`
- **Dipendenze**: `arch-packages/` con PKGBUILD
- **Assets**: `.config/quickshell/ii/assets/`

## Convenzioni naming
- **Moduli QML**: PascalCase (es. `GlobalStates.qml`)
- **Directory**: lowercase con trattini (es. `sidebar-left`)
- **Variabili bash**: UPPERCASE per globali, lowercase per locali
- **Pacchetti**: `illogical-impulse-*` prefix

## Design patterns
- **Modularità**: Ogni widget in modulo separato
- **Riusabilità**: Componenti comuni in `modules/common/`
- **Configurabilità**: Settings centralizzati
- **Material Design 3**: Colori e stile seguono le specifiche MD3