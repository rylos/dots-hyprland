#!/bin/bash
# Script per backup delle configurazioni esistenti prima dell'installazione
# Parte del progetto dots-hyprland

set -e

TIMESTAMP=$(date +%Y%m%d-%H%M%S)
BACKUP_DIR="$HOME/.config-backup-$TIMESTAMP"

# Colori per output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

print_header() {
    echo -e "${BLUE}================================${NC}"
    echo -e "${BLUE}  Backup Configurazioni Esistenti${NC}"
    echo -e "${BLUE}================================${NC}"
    echo ""
}

print_info() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[✓]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[!]${NC} $1"
}

print_error() {
    echo -e "${RED}[✗]${NC} $1"
}

# Configurazioni che verranno sovrascritte (directory)
DIRS_TO_BACKUP=(
    "fish"
    "fontconfig" 
    "kitty"
    "mpv"
    "nvim"
    "fcitx5"
    "foot"
    "fuzzel"
    "Kvantum"
    "qt5ct"
    "qt6ct"
    "wlogout"
    "xdg-desktop-portal"
    "kde-material-you-colors"
    "matugen"
    "quickshell"
    "zshrc.d"
)

# File singoli che verranno sovrascritti
FILES_TO_BACKUP=(
    "dolphinrc"
    "kdeglobals"
    "konsolerc"
    "starship.toml"
    "darklyrc"
    "chrome-flags.conf"
    "code-flags.conf"
    "thorium-flags.conf"
)

backup_directories() {
    local backed_up=0
    
    print_info "Controllo directory da backuppare..."
    
    for dir in "${DIRS_TO_BACKUP[@]}"; do
        if [ -d "$HOME/.config/$dir" ]; then
            print_info "Backup: $dir -> $BACKUP_DIR/$dir"
            cp -r "$HOME/.config/$dir" "$BACKUP_DIR/"
            ((backed_up++))
        fi
    done
    
    return $backed_up
}

backup_files() {
    local backed_up=0
    
    print_info "Controllo file da backuppare..."
    
    for file in "${FILES_TO_BACKUP[@]}"; do
        if [ -f "$HOME/.config/$file" ]; then
            print_info "Backup: $file -> $BACKUP_DIR/$file"
            cp "$HOME/.config/$file" "$BACKUP_DIR/"
            ((backed_up++))
        fi
    done
    
    return $backed_up
}

create_restore_script() {
    cat > "$BACKUP_DIR/restore.sh" << 'EOF'
#!/bin/bash
# Script di ripristino configurazioni backup
# Generato automaticamente

BACKUP_DIR="$(dirname "$0")"
CONFIG_DIR="$HOME/.config"

show_help() {
    echo "Script di ripristino configurazioni backup"
    echo ""
    echo "Uso: $0 [opzione] [componente]"
    echo ""
    echo "Opzioni:"
    echo "  -h, --help         Mostra questo aiuto"
    echo "  -l, --list         Lista componenti disponibili"
    echo "  -a, --all          Ripristina tutto"
    echo "  -i, --interactive  Modalità interattiva"
    echo ""
    echo "Esempi:"
    echo "  $0 kitty           # Ripristina solo Kitty"
    echo "  $0 -a              # Ripristina tutto"
    echo "  $0 -i              # Modalità interattiva"
}

list_components() {
    echo "Componenti disponibili nel backup:"
    for item in "$BACKUP_DIR"/*; do
        if [ -d "$item" ] && [ "$(basename "$item")" != "." ] && [ "$(basename "$item")" != ".." ]; then
            echo "  ✓ $(basename "$item") (directory)"
        elif [ -f "$item" ] && [ "$(basename "$item")" != "restore.sh" ]; then
            echo "  ✓ $(basename "$item") (file)"
        fi
    done
}

restore_component() {
    local component="$1"
    
    if [ -d "$BACKUP_DIR/$component" ]; then
        echo "Ripristino directory $component..."
        rm -rf "$CONFIG_DIR/$component"
        cp -r "$BACKUP_DIR/$component" "$CONFIG_DIR/"
        echo "✓ $component ripristinato"
    elif [ -f "$BACKUP_DIR/$component" ]; then
        echo "Ripristino file $component..."
        cp "$BACKUP_DIR/$component" "$CONFIG_DIR/"
        echo "✓ $component ripristinato"
    else
        echo "✗ $component non trovato nel backup"
        return 1
    fi
}

restore_all() {
    echo "Ripristino di tutte le configurazioni..."
    echo ""
    
    local restored=0
    local failed=0
    
    for item in "$BACKUP_DIR"/*; do
        if [ -d "$item" ] || ([ -f "$item" ] && [ "$(basename "$item")" != "restore.sh" ]); then
            component=$(basename "$item")
            if restore_component "$component"; then
                ((restored++))
            else
                ((failed++))
            fi
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
    
    for item in "$BACKUP_DIR"/*; do
        if [ -d "$item" ] || ([ -f "$item" ] && [ "$(basename "$item")" != "restore.sh" ]); then
            component=$(basename "$item")
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
EOF
    
    chmod +x "$BACKUP_DIR/restore.sh"
    print_success "Script di ripristino creato: $BACKUP_DIR/restore.sh"
}

create_info_file() {
    cat > "$BACKUP_DIR/BACKUP-INFO.txt" << EOF
BACKUP CONFIGURAZIONI DOTS-HYPRLAND
===================================

Data backup: $(date)
Percorso: $BACKUP_DIR

Questo backup contiene le configurazioni esistenti che verranno
sovrascritte durante l'installazione dei dotfiles.

UTILIZZO SCRIPT DI RIPRISTINO:
------------------------------
./restore.sh --help         # Mostra aiuto
./restore.sh --list         # Lista componenti
./restore.sh --all          # Ripristina tutto
./restore.sh --interactive  # Modalità interattiva
./restore.sh kitty          # Ripristina solo kitty

ATTENZIONE:
-----------
Il ripristino sovrascriverà le configurazioni dei dotfiles
con quelle originali. Usa con cautela.

Per maggiori informazioni consulta BACKUP-INFO.md nel progetto.
EOF
    
    print_success "File informativo creato: $BACKUP_DIR/BACKUP-INFO.txt"
}

main() {
    print_header
    
    # Controlla se esistono configurazioni da backuppare
    local has_configs=false
    
    for dir in "${DIRS_TO_BACKUP[@]}"; do
        [ -d "$HOME/.config/$dir" ] && has_configs=true && break
    done
    
    if [ "$has_configs" = false ]; then
        for file in "${FILES_TO_BACKUP[@]}"; do
            [ -f "$HOME/.config/$file" ] && has_configs=true && break
        done
    fi
    
    if [ "$has_configs" = false ]; then
        print_warning "Nessuna configurazione esistente trovata da backuppare"
        print_info "Puoi procedere con l'installazione senza preoccupazioni"
        exit 0
    fi
    
    # Crea directory di backup
    print_info "Creazione directory di backup: $BACKUP_DIR"
    mkdir -p "$BACKUP_DIR"
    
    # Backup directory
    backup_directories
    local dirs_backed_up=$?
    
    # Backup file
    backup_files  
    local files_backed_up=$?
    
    local total_backed_up=$((dirs_backed_up + files_backed_up))
    
    if [ $total_backed_up -eq 0 ]; then
        print_warning "Nessun file da backuppare trovato"
        rmdir "$BACKUP_DIR" 2>/dev/null || true
        exit 0
    fi
    
    # Crea script di ripristino
    create_restore_script
    
    # Crea file informativo
    create_info_file
    
    echo ""
    print_success "Backup completato!"
    print_info "Directory: $BACKUP_DIR"
    print_info "Configurazioni salvate: $total_backed_up"
    echo ""
    print_info "Per ripristinare le configurazioni originali:"
    echo "  $BACKUP_DIR/restore.sh --help"
    echo ""
}

# Esegui solo se chiamato direttamente
if [ "${BASH_SOURCE[0]}" = "${0}" ]; then
    main "$@"
fi