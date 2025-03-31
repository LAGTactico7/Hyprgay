echo ""
echo "Instalando dependencias muy gays..."
echo ""
sudo pacman -S btop cava cmus fastfetch hyprland kitty micro git

echo ""
echo "Espera un poquito mas precioso..."
echo ""
paru -S tofi waybar-cava oh-my-zsh-git zsh zsh-theme-powerlevel10k hyprshot

echo ""
echo "Copiando archivos de configuracion mas gays aun..."
echo ""

[ -d ".config" ] && cp -r .config/* ~/.config/ && echo "Archivos de .config copiados a ~/.config." || echo "No se encontró .config."
[ -d ".fonts" ] && cp -r .fonts/* ~/ && echo "Archivos de .fonts copiados a ~/" || echo "No se encontró .fonts"
[ -d ".icons" ] && cp -r .icons/* ~/ && echo "Archivos de .icons copiados a ~/" || echo "No se encontró .icons"
[ -d "wallpapers" ] && cp -r wallpapers/* ~/ && echo "Archivos de wallpapers copiados a ~/" || echo "No se encontró wallpapers"
[ -d ".p10k.zsh" ] && cp .p10k.zsh ~/ && echo "Archivos de .p10k.zsh copiados a ~/" || echo "No se encontró .p10k.zsh"
[ -d ".zshrc" ] && cp .zshrc ~/ && echo "Archivos de .zshrc copiados a ~/" || echo "No se encontró .zshrc"

# Cambiar el shell solo si Zsh está instalado y no es el actual
if [ "$SHELL" != "/usr/bin/zsh" ] && command -v zsh &> /dev/null; then
    sudo chsh -s /usr/bin/zsh $USER
else
    echo "Zsh ya está configurado como shell predeterminado."
fi

# Clonando los plugins de zsh solo si no existen
ZSH_PLUGIN_DIR="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins"

mkdir -p "$ZSH_PLUGIN_DIR"

if [ ! -d "$ZSH_PLUGIN_DIR/zsh-autosuggestions" ]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_PLUGIN_DIR/zsh-autosuggestions"
else
    echo "zsh-autosuggestions ya está instalado, omitiendo..."
fi

if [ ! -d "$ZSH_PLUGIN_DIR/zsh-syntax-highlighting" ]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH_PLUGIN_DIR/zsh-syntax-highlighting"
else
    echo "zsh-syntax-highlighting ya está instalado, omitiendo..."
fi

if [ ! -d "$ZSH_PLUGIN_DIR/zsh-256color" ]; then
    git clone https://github.com/chrissicool/zsh-256color "$ZSH_PLUGIN_DIR/zsh-256color"
else
    echo "zsh-256color ya está instalado, omitiendo..."
fi

echo ""
echo "Instalacion completa ahora eres totalmente gay."
echo ""
