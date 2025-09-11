#!/bin/bash
# Script di ripristino configurazioni backup
# Creato: 2025-09-11 09:39:03

BACKUP_DIR="$(dirname "$0")"
CONFIG_DIR="$HOME/.config"

show_help() {
    echo "Script di ripristino configurazioni backup"
    echo ""
    echo "Uso: $0 [opzione] [componente]"
    echo ""
    echo "Opzioni:"
    echo "  -h, --help     Mostra questo aiuto"
    echo "  -l, --list     Lista componenti disponibili"
    echo "  -a, --all      Ripristina tutto"
    echo "  -i, --interactive  Modalità interattiva"
    echo ""
    echo "Componenti disponibili:"
    echo "  fish           Configurazione Fish shell"
    echo "  fontconfig     Configurazione font"
    echo "  kitty          Configurazione terminale Kitty"
    echo "  mpv            Configurazione player MPV"
    echo "  nvim           Configurazione editor Neovim"
    echo "  dolphinrc      Impostazioni Dolphin"
    echo "  kdeglobals     Impostazioni KDE"
    echo "  konsolerc      Impostazioni Konsole"
    echo ""
    echo "Esempi:"
    echo "  $0 kitty                    # Ripristina solo Kitty"
    echo "  $0 -a                       # Ripristina tutto"
    echo "  $0 -i                       # Modalità interattiva"
}

list_components() {
    echo "Componenti disponibili nel backup:"
    [ -d "$BACKUP_DIR/fish" ] && echo "  ✓ fish"
    [ -d "$BACKUP_DIR/fontconfig" ] && echo "  ✓ fontconfig"
    [ -d "$BACKUP_DIR/kitty" ] && echo "  ✓ kitty"
    [ -d "$BACKUP_DIR/mpv" ] && echo "  ✓ mpv"
    [ -d "$BACKUP_DIR/nvim" ] && echo "  ✓ nvim"
    [ -f "$BACKUP_DIR/dolphinrc" ] && echo "  ✓ dolphinrc"
    [ -f "$BACKUP_DIR/kdeglobals" ] && echo "  ✓ kdeglobals"
    [ -f "$BACKUP_DIR/konsolerc" ] && echo "  ✓ konsolerc"
}

restore_component() {
    local component="$1"
    
    case "$component" in
        fish|fontconfig|kitty|mpv|nvim)
            if [ -d "$BACKUP_DIR/$component" ]; then
                echo "Ripristino $component..."
                rm -rf "$CONFIG_DIR/$component"
                cp -r "$BACKUP_DIR/$component" "$CONFIG_DIR/"
                echo "✓ $component ripristinato"
            else
                echo "✗ $component non trovato nel backup"
                return 1
            fi
            ;;
        dolphinrc|kdeglobals|konsolerc)
            if [ -f "$BACKUP_DIR/$component" ]; then
                echo "Ripristino $component..."
                cp "$BACKUP_DIR/$component" "$CONFIG_DIR/"
                echo "✓ $component ripristinato"
            else
                echo "✗ $component non trovato nel backup"
                return 1
            fi
            ;;
        *)
            echo "✗ Componente '$component' non riconosciuto"
            echo "Usa '$0 --list' per vedere i componenti disponibili"
            return 1
            ;;
    esac
}

restore_all() {
    echo "Ripristino di tutte le configurazioni..."
    echo ""
    
    local components=(fish fontconfig kitty mpv nvim dolphinrc kdeglobals konsolerc)
    local restored=0
    local failed=0
    
    for component in "${components[@]}"; do
        if restore_component "$component"; then
            ((restored++))
        else
            ((failed++))
        fi
    done
    
    echo ""
    echo "Ripristino completato:"
    echo "  ✓ Ripristinati: $restored"
    [ $failed -gt 0 ] && echo "  ✗ Falliti: $failed"
}

interactive_mode() {
    echo "=== Modalità Interattiva ==="
    echo ""
    list_components
    echo ""
    
    local components=(fish fontconfig kitty mpv nvim dolphinrc kdeglobals konsolerc)
    
    for component in "${components[@]}"; do
        if [ -d "$BACKUP_DIR/$component" ] || [ -f "$BACKUP_DIR/$component" ]; then
            echo -n "Ripristinare $component? [y/N]: "
            read -r response
            case "$response" in
                [yY]|[yY][eE][sS])
                    restore_component "$component"
                    ;;
                *)
                    echo "Saltato $component"
                    ;;
            esac
            echo ""
        fi
    done
}

# Main
case "$1" in
    -h|--help)
        show_help
        ;;
    -l|--list)
        list_components
        ;;
    -a|--all)
        restore_all
        ;;
    -i|--interactive)
        interactive_mode
        ;;
    "")
        echo "Errore: Specificare un componente o un'opzione"
        echo "Usa '$0 --help' per l'aiuto"
        exit 1
        ;;
    *)
        restore_component "$1"
        ;;
esac