#!/bin/zsh

echo -e "\nInstaling brew and brew pkgs...\n"
brew --prefix || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
export BREW_PREFIX=$(brew --prefix)
brew update
brew upgrade
brew bundle
brew cleanup
ln -s "${BREW_PREFIX}/bin/gsha256sum" "${BREW_PREFIX}/bin/sha256sum"
