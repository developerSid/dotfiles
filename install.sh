#!/usr/bin/env bash

mkdir -p ~/.config/alacritty/ ~/.config/zellij

cd ~
ln -sf ~/.dotfiles/zshrc .zshrc
ln -sf ~/.dotfiles/gitconfig .gitconfig
ln -sf ~/.dotfiles/alacritty.toml ~/.config/alacritty/alacritty.toml
ln -sf ~/.dotfiles/zellij.kdl ~/.config/zellij/config.kdl

if [ -d "$HOME/.sdkman/etc/" ]; then
   ln -sf ~/.dotfiles/sdkmanconfig ~/.sdkman/etc/config
fi
