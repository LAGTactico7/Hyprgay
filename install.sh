echo ""
echo "Instalando dependencias muy gays..."
echo ""

sudo pacman -S --noconfirm hyprland hyprpaper hyprpicker kitty btop cava cmus fastfetch micro wl-clipboard git ttf-ibm-plex thunar 

echo ""
echo "Espera un poquito más, precioso..."
echo ""

git clone https://aur.archlinux.org/paru-bin.git
cd paru-bin 
makepkg -si --noconfirm
cd ..
paru -Sy
paru -S --noconfirm tofi waybar-cava oh-my-zsh-git zsh-theme-powerlevel10k hyprshot

echo ""
echo "Copiando archivos de configuración más gays aún..."
echo ""

cp -r .config ~/ && echo "Archivos de .config copiados a ~/.config." || echo "No se encontró .config."
cp -r fonts ~/.local/share/fonts && echo "Archivos de .fonts copiados a ~/" || echo "No se encontró .fonts"
cp -r .icons ~/ && echo "Archivos de .icons copiados a ~/" || echo "No se encontró .icons"
cp -r wallpapers ~/.config/ && echo "Archivos de wallpapers copiados a ~/" || echo "No se encontró wallpapers"
cp .p10k.zsh ~/ && echo "Archivos de .p10k.zsh copiados a ~/" || echo "No se encontró .p10k.zsh"
cp .zshrc ~/ && echo "Archivos de .zshrc copiados a ~/" || echo "No se encontró .zshrc"

if [ "$SHELL" != "/usr/bin/zsh" ] && command -v zsh &> /dev/null; then
    sudo chsh -s /usr/bin/zsh $USER
else
    echo "Zsh ya está configurado como shell predeterminado."
fi

if [ -z "$ZSH_CUSTOM" ]; then
    ZSH_CUSTOM="$HOME/.oh-my-zsh/custom"
fi

ZSH_PLUGIN_DIR="$ZSH_CUSTOM/plugins"
ZSH_THEME_DIR="$ZSH_CUSTOM/themes"
mkdir -p "$ZSH_PLUGIN_DIR"
mkdir -p "$ZSH_THEME_DIR"

echo "Instalando plugins de Zsh..."

for repo in "zsh-users/zsh-autosuggestions" "zsh-users/zsh-syntax-highlighting" "chrissicool/zsh-256color"; do
    plugin_name=$(basename "$repo")
    if [ ! -d "$ZSH_PLUGIN_DIR/$plugin_name" ]; then
        git clone "https://github.com/$repo" "$ZSH_PLUGIN_DIR/$plugin_name"
        echo "$plugin_name instalado."
    else
        echo "$plugin_name ya está instalado, omitiendo..."
    fi
done

if [ ! -d "$ZSH_THEME_DIR/powerlevel10k" ]; then
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$ZSH_THEME_DIR/powerlevel10k"
    echo "powerlevel10k instalado."
else
    echo "powerlevel10k ya está instalado, omitiendo..."
fi


echo ""
echo "Instalación completa. Ahora eres oficialmente gay."
echo ""
read -p "Presiona Enter para cerrar..."
