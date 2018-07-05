#!/bin/bash
#
# Homebrew
#
# This installs some of the common dependencies needed (or at least desired)
# using Homebrew.

# Check for Homebrew
if test ! $(which brew)
then
  echo "Installing Homebrew + Cask + Bundle for you."

  # Install the correct homebrew for each OS type
  if test "$(uname)" = "Darwin"
  then
    SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    brew update
    brew tap caskroom/cask
    brew tap Homebrew/bundle
    brew bundle --file=${SCRIPT_DIR}/Brewfile
  elif test "$(expr substr $(uname -s) 1 5)" = "Linux"
  then
    echo "On linux don't need Homebrew"
  fi

fi

exit 0
