echo ""
echo "Instalando dependencias muy gays..."
echo ""
sudo pacman -S btop cava cmus fastfetch hyprland kitty micro git

echo ""
echo "Espera un poquito mas precioso..."
echo ""
paru -S tofi
paru -S waybar-cava
paru -S oh-my-zsh-git
paru -S zsh
paru -S zsh-theme-powerlevel10k

echo ""
echo "Copiando archivos de configuracion mas gays aun..."
echo ""
mkdir -p ~/.config/
cp -r $HOME/hyprgay/btop ~/.config/
cp -r $HOME/hyprgay/cava ~/.config/
cp -r $HOME/hyprgay/cmus ~/.config/
cp -r $HOME/hyprgay/fastfetch ~/.config/
cp -r $HOME/hyprgay/hypr ~/.config/
cp -r $HOME/hyprgay/kitty ~/.config/
cp -r $HOME/hyprgay/micro ~/.config/
cp -r $HOME/hyprgay/tofi ~/.config/
cp -r $HOME/hyprgay/waybar ~/.config/
cp -r $HOME/hyprgay/wallpapers ~/.config/
cp -r $HOME/hyprgay/.fonts ~/
cp -r $HOME/hyprgay/.icons ~/
cp $HOME/hyprgay/.p10k.zsh ~/
cp $HOME/hyprgay/.zshrc ~/

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
