#!/bin/bash
#
# Homebrew
#
# This installs some of the common dependencies needed (or at least desired)
# using Homebrew.

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Check for Homebrew
if test ! $(which brew)
then
  echo "Installing Homebrew + Cask + Bundle for you."

  # Install the correct homebrew for each OS type
  if test "$(uname)" = "Darwin"
  then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  elif test "$(expr substr $(uname -s) 1 5)" = "Linux"
  then
    echo "On linux don't need Homebrew"
    exit 1
  fi
fi

brew update
brew tap caskroom/cask
brew tap Homebrew/bundle
brew bundle --file=${SCRIPT_DIR}/Brewfile

exit 0
