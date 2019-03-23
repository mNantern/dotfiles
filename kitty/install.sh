#!/bin/bash
#
# Kitty : https://github.com/kovidgoyal/kitty

mkdir -p ~/.config/kitty/
dotfile_root=$(pwd -P)
ln -fs "${dotfile_root}/kitty/kitty.conf" ~/.config/kitty/kitty.conf
