#!/bin/bash

cd "$(dirname "$0")"
DOTFILES_ROOT=$(pwd -P)

install_dotfiles () {
  echo "Installing dotfiles"
  for link in $(find -H "$DOTFILES_ROOT" -maxdepth 2 -name '*.symlink' -not -path '*.git*')
  do
    dst="$HOME/.$(basename "${link%.*}")"
    src="$(dirname "$link")/$(basename "${link%.*}")"
    echo "  linking $src to $dst"
    ln -s "$src" "$dst"
  done
}

install_dotfiles
