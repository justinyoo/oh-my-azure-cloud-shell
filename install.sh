# Install oh-my-zsh
echo "[$(date +"%Y-%m-%d %H:%M:%S")] Installing oh-my-zsh ..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install theme: Spaceship
echo "[$(date +"%Y-%m-%d %H:%M:%S")] Installing theme: Spaceship ..."
git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"

# Install plugins
echo "[$(date +"%Y-%m-%d %H:%M:%S")] Installing plugins ..."
git clone https://github.com/zsh-users/zsh-completions.git $ZSH_CUSTOM/plugins/zsh-completions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
git clone git://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions

# Copy .bashrc
echo "[$(date +"%Y-%m-%d %H:%M:%S")] Replacing .bashrc ..."
mv $HOME/.bashrc $HOME/.bashrc_backup
cp ./azure-cloud-shell/.bashrc $HOME/.bashrc
    
# Copy .zshrc
echo "[$(date +"%Y-%m-%d %H:%M:%S")] Copying .zshrc ..."
cp ./azure-cloud-shell/.zshrc $HOME/.zshrc
