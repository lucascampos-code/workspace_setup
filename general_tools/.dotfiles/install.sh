#!/bin/sh

set -e


cp -r . ~/.dotfiles 

echo
echo "$(tput bold)~~~ Installing xcode-select $(tput sgr0)"
if ! [ -x "$(xcode-select -p)" ]; then
  xcode-select --install
else
  echo "    Already installed, skipping."
fi
echo
if ! [ -x "$(command -v brew)" ]; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  echo "    Already installed, skipping."
fi
echo

#brew update
#brew tap homebrew/bundle
brew bundle

echo "$(tput bold)~~~ Installing omz $(tput sgr0)"
if ! [ -d ~/.oh-my-zsh ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
else
  echo "    Already installed, skipping."
fi
echo

echo "$(tput bold)~~~ Creating symbolic link at ~/.zshrc ... $(tput sgr0)"
if ! [ -f ~/.zshrc ]; then
  ln -s ~/.dotfiles/.zshrc ~/.zshrc
else
  echo "    ~/.zshrc already exists. Leaving it alone."
fi
echo

