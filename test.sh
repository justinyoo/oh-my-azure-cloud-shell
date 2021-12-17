#!/bin/bash

set -e

function usage() {
    cat <<USAGE

    Usage: $0 -t|--theme theme [-c|--with-clock]

    Options:
        -t|--theme:      The name of Theme.
                         It only accepts either 'spaceship' or 'p10k'.
                         Default: 'spaceship'

        -c|--with-clock: If the name of theme is 'p10k',
                         this switch indicates whether to enable clock or not.

        -h|--help:       Show this message.
USAGE

    exit 1
}

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
    echo "Invalid theme"
    usage

    exit 1
fi

if [[ $theme_name == "spaceship" ]]; then
    echo "theme - spaceship"
elif [[ $theme_name == "p10k" ]]; then
    echo "theme - p10k"

    if [[ $with_clock == "true" ]]; then
        echo "with clock: true"
    else
        echo "with clock: false"
    fi
fi

echo "Theme Name: $theme_name"
echo "With Clock: $with_clock"


#while getopts t:c: flag
#do
#    case "${flag}" in
#        t) theme=${OPTARG};;
#        c) clock=${OPTARG};;
#    esac
#done

#if [[ $theme == "spaceship" ]]; then
#    echo "theme - spaceship: $theme";
#elif [[ $theme == "p10k" ]]; then
#    echo "theme - p10k: $theme";
#else
#    theme="spaceship";
#    echo "default theme to 'spaceship'";
#fi

#if [[ $clock == "true" ]]; then
#    echo "clock accepted: $clock";
#elif [[ $clock == "false" ]]; then
#    echo "clock rejected: $clock";
#else
#    clock="true";
#    echo "default clock to 'true'";
#fi

#echo "theme: $theme";
#echo "clock: $clock";
