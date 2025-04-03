# Cambiar el shell solo si Zsh está instalado y no es el actual
if [ "$SHELL" != "/usr/bin/zsh" ] && command -v zsh &> /dev/null; then
    sudo chsh -s /usr/bin/zsh $USER
else
    echo "Zsh ya está configurado como shell predeterminado."
fi

# Definir correctamente la ruta de Oh My Zsh si no existe
if [ -z "$ZSH_CUSTOM" ]; then
    ZSH_CUSTOM="$HOME/.oh-my-zsh/custom"
fi

ZSH_PLUGIN_DIR="$ZSH_CUSTOM/plugins"
ZSH_THEME_DIR="$ZSH_CUSTOM/themes"
mkdir -p "$ZSH_PLUGIN_DIR"
mkdir -p "$ZSH_THEME_DIR"

echo "Instalando plugins de Zsh..."

# Clonando cada plugin solo si no existe
for repo in "zsh-users/zsh-autosuggestions" "zsh-users/zsh-syntax-highlighting" "chrissicool/zsh-256color"; do
    plugin_name=$(basename "$repo")
    if [ ! -d "$ZSH_PLUGIN_DIR/$plugin_name" ]; then
        git clone "https://github.com/$repo" "$ZSH_PLUGIN_DIR/$plugin_name"
        echo "$plugin_name instalado."
    else
        echo "$plugin_name ya está instalado, omitiendo..."
    fi
done

# Clonando el tema powerlevel10k si no está
if [ ! -d "$ZSH_THEME_DIR/powerlevel10k" ]; then
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$ZSH_THEME_DIR/powerlevel10k"
    echo "powerlevel10k instalado."
else
    echo "powerlevel10k ya está instalado, omitiendo..."
fi
