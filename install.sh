#!/bin/bash

set -e

# Install oh-my-zsh
echo "[$(date +"%Y-%m-%d %H:%M:%S")] Installing oh-my-zsh ..."
echo "[$(date +"%Y-%m-%d %H:%M:%S")] While installing oh-my-zsh, you might be asked:"
echo "[$(date +"%Y-%m-%d %H:%M:%S")]     'Do you want to change your default shell to zsh? [Y/n]'"
echo "[$(date +"%Y-%m-%d %H:%M:%S")]"
echo "[$(date +"%Y-%m-%d %H:%M:%S")] Then type 'n' and continue ..."
echo "[$(date +"%Y-%m-%d %H:%M:%S")]"
echo "[$(date +"%Y-%m-%d %H:%M:%S")] Once you see the oh my zsh prompt, type 'exit' to continue to install the remainders ..."
echo "[$(date +"%Y-%m-%d %H:%M:%S")]"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install theme: Spaceship
echo "[$(date +"%Y-%m-%d %H:%M:%S")] Continuing to install the remainders ..."
echo "[$(date +"%Y-%m-%d %H:%M:%S")]"
echo "[$(date +"%Y-%m-%d %H:%M:%S")] Installing theme: Spaceship ..."
git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$HOME/.oh-my-zsh/custom/themes/spaceship-prompt" --depth=1
ln -s "$HOME/.oh-my-zsh/custom/themes/spaceship-prompt/spaceship.zsh-theme" "$HOME/.oh-my-zsh/custom/themes/spaceship.zsh-theme"

# Install plugins
echo "[$(date +"%Y-%m-%d %H:%M:%S")] Installing plugins ..."
git clone https://github.com/zsh-users/zsh-completions.git $HOME/.oh-my-zsh/custom/plugins/zsh-completions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
git clone git://github.com/zsh-users/zsh-autosuggestions.git $HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions

# Copy .bashrc
echo "[$(date +"%Y-%m-%d %H:%M:%S")] Replacing .bashrc ..."
mv $HOME/.bashrc $HOME/.bashrc_backup
cp $HOME/oh-my-azure-cloud-shell/azure-cloud-shell/.bashrc $HOME/.bashrc
    
# Copy .zshrc
echo "[$(date +"%Y-%m-%d %H:%M:%S")] Copying .zshrc ..."
cp $HOME/oh-my-azure-cloud-shell/azure-cloud-shell/.zshrc $HOME/.zshrc

echo "[$(date +"%Y-%m-%d %H:%M:%S")] Installation completed. Type 'exit' to restart your Azure Cloud Shell session ..."
