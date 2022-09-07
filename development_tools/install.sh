#!/bin/sh

if ! [ -x "$(command -v brew)" ]; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  echo "    Already installed, skipping."
fi
echo

brew bundle

echo "$(tput bold)~~~ Creating symbolic link for OpenJDK 11 ... $(tput sgr0)"
if ! [ -h /Library/Java/JavaVirtualMachines/openjdk-11.jdk ]; then
    sudo ln -sfn /opt/homebrew/opt/openjdk@11/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk-11.jdk
else
  echo "    OpenJDK 11 already linked. Leaving it alone."
fi
echo
