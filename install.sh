#!/bin/bash

set -e

# Usage function
function usage() {
    cat <<USAGE

    Usage: $0 -t|--theme theme [-c|--with-clock]

    Options:
        -t|--theme:      The name of Theme.
                         It only accepts either 'spaceship' or 'p10k'.
                         Default: 'spaceship'

        -c|--with-clock: This switch enables clock, if the name of theme is 'p10k'.

        -h|--help:       Show this message.

USAGE

    exit 1
}

# Set up arguments
theme_name=spaceship
with_clock=false

if [[ $# -eq 0 ]]; then
    theme_name=spaceship
    with_clock=false
fi

while [[ "$1" != "" ]]; do
    case $1 in
    -t | --theme)
        shift
        theme_name=$1
        ;;

    -c | --with-clock)
        with_clock=true
        ;;

    -h | --help)
        usage
        exit 1
        ;;

    *)
        usage
        exit 1
        ;;
    esac

    shift
done

if [[ $theme_name == "" ]]; then
    echo "Theme not found"
    usage

    exit 1
elif [[ $theme_name != "spaceship" ]] && [[ $theme_name != "p10k" ]]; then
    echo "Theme not valid"
    usage

    exit 1
fi

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

echo "[$(date +"%Y-%m-%d %H:%M:%S")] Continuing to install the remainders ..."
echo "[$(date +"%Y-%m-%d %H:%M:%S")]"

# Install oh-my-zsh plugins
echo "[$(date +"%Y-%m-%d %H:%M:%S")] Installing plugins ..."
git clone https://github.com/zsh-users/zsh-completions.git $HOME/.oh-my-zsh/custom/plugins/zsh-completions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
git clone git://github.com/zsh-users/zsh-autosuggestions.git $HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions

# Install theme: Spaceship
if [[ $theme_name == "spaceship" ]]; then
    echo "[$(date +"%Y-%m-%d %H:%M:%S")] Installing theme: Spaceship ..."
    git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$HOME/.oh-my-zsh/custom/themes/spaceship-prompt" --depth=1
    ln -s "$HOME/.oh-my-zsh/custom/themes/spaceship-prompt/spaceship.zsh-theme" "$HOME/.oh-my-zsh/custom/themes/spaceship.zsh-theme"

    # Copy .zshrc
    echo "[$(date +"%Y-%m-%d %H:%M:%S")] Copying .zshrc for spaceship ..."
    cp $HOME/oh-my-azure-cloud-shell/azure-cloud-shell/.zshrc-spaceship $HOME/.zshrc

# Install theme: Powerlevel10k
elif [[ $theme_name == "p10k" ]]; then
    echo "[$(date +"%Y-%m-%d %H:%M:%S")] Installing theme: Spaceship ..."
    git clone https://github.com/romkatv/powerlevel10k.git "$HOME/.oh-my-zsh/custom/themes/powerlevel10k" --depth=1
    ln -s "$HOME/.oh-my-zsh/custom/themes/powerlevel10k/powerlevel10k.zsh-theme" "$HOME/.oh-my-zsh/custom/themes/powerlevel10k.zsh-theme"

    # Copy .zshrc
    echo "[$(date +"%Y-%m-%d %H:%M:%S")] Copying .zshrc for powerlevel10k ..."
    cp $HOME/oh-my-azure-cloud-shell/azure-cloud-shell/.zshrc-p10k $HOME/.zshrc

    # Install p10k config with clock
    if [[ $with_clock == "true" ]]; then
        # Copy p10k.zsh
        echo "[$(date +"%Y-%m-%d %H:%M:%S")] Copying .p10k.zsh with clock ..."
        cp $HOME/oh-my-azure-cloud-shell/azure-cloud-shell/.p10k-with-clock.zsh $HOME/.p10k.zsh
    
    # Install p10k config without clock
    else
        # Copy p10k.zsh
        echo "[$(date +"%Y-%m-%d %H:%M:%S")] Copying p10k.zsh without clock ..."
        cp $HOME/oh-my-azure-cloud-shell/azure-cloud-shell/.p10k-without-clock.zsh $HOME/.p10k.zsh
    fi
fi

# Copy .bashrc
echo "[$(date +"%Y-%m-%d %H:%M:%S")] Replacing .bashrc ..."
mv $HOME/.bashrc $HOME/.bashrc_backup
cp $HOME/oh-my-azure-cloud-shell/azure-cloud-shell/.bashrc $HOME/.bashrc

echo "[$(date +"%Y-%m-%d %H:%M:%S")] Installation completed. Type 'exit' to restart your Azure Cloud Shell session ..."
