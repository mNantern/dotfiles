#!/bin/bash

cd "$(dirname "$0")"
DOTFILES_ROOT=$(pwd -P)


setup_gitconfig () {
  if ! [ -f git/gitconfig.local.symlink ]
  then
    echo 'setup gitconfig'

    git_credential='cache'
    if [ "$(uname -s)" == "Darwin" ]
    then
      git_credential='osxkeychain'
    fi

    echo ' - What is your github author name?'
    read -e git_authorname
    echo ' - What is your github author email?'
    read -e git_authoremail

    sed -e "s/AUTHORNAME/$git_authorname/g" -e "s/AUTHOREMAIL/$git_authoremail/g" -e "s/GIT_CREDENTIAL_HELPER/$git_credential/g" git/gitconfig.local.template > git/gitconfig.local.symlink
  fi
}

install_dotfiles () {
  echo "Installing dotfiles"
  for src in $(find -H "$DOTFILES_ROOT" -maxdepth 2 -name '*.symlink' -not -path '*.git*')
  do
    dst="$HOME/.$(basename "${src%.*}")"
    echo "  linking $src to $dst"
    ln -fs "$src" "$dst"
  done
}

setup_gitconfig
install_dotfiles
