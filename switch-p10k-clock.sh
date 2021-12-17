#!/bin/bash

set -e

function usage() {
    cat <<USAGE

    Usage: $0 -c|--with-clock

    Options:
        -c|--with-clock: This switch enables clock.

        -h|--help:       Show this message.

USAGE

    exit 1
}

with_clock=false

if [[ $# -eq 0 ]]; then
    with_clock=false
fi

while [[ "$1" != "" ]]; do
    case $1 in
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

# Backup p10k.zsh
mv $HOME/p10.zsh $HOME/p10.zsh_backup

# Install p10k config with clock
if [[ $with_clock == "true" ]]; then
    echo "[$(date +"%Y-%m-%d %H:%M:%S")] Copying p10k.zsh with clock ..."
    cp $HOME/oh-my-azure-cloud-shell/azure-cloud-shell/p10k-with-clock.zsh $HOME/p10.zsh

# Install p10k config without clock
else
    echo "[$(date +"%Y-%m-%d %H:%M:%S")] Copying p10k.zsh without clock ..."
    cp $HOME/oh-my-azure-cloud-shell/azure-cloud-shell/p10k-without-clock.zsh $HOME/p10.zsh
fi

source $HOME/p10.zsh

echo "[$(date +"%Y-%m-%d %H:%M:%S")] Switch completed."
