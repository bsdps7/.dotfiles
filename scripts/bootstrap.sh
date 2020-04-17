#!/bin/sh

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `setup.sh` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

## Update the OS
echo "Updating the OS..."
sudo softwareupdate -ia --verbose

## Install Homebrew if not found or update if found
if [[ -z $(which brew) ]]
then
  echo "Installing Homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
  echo "Updating Homebrew..."
  brew update
fi
brew doctor

## Wait for user confirmation to continue executing brew.sh
read -p "Execute brew.sh? (y/n): " -n 1 REPLY && echo "" && [[ "$REPLY" =~ ^[Yy]$ ]] || exit 1
if [[ "$REPLY" =~ ^[Yy]$ ]]
then
  echo "Running brew.sh..."
  ## Execute brew.sh
  ./brew.sh
else
  exit 1
fi

## Change shell to newer shell installed from Homebrew
sudo dscl . -create /Users/$USER UserShell /usr/local/bin/zsh

## Wait for user confirmation to continue executing macos.sh
read -p "Execute macos.sh? (y/n): " -n 1 REPLY && echo "" && [[ "$REPLY" =~ ^[Yy]$ ]] || exit 1
if [[ "$REPLY" =~ ^[Yy]$ ]]
then
  echo "Running macos.sh..."
  ## Execute macos.sh
  ./macos.sh

  ## Restart the system
  osascript -e 'tell app "loginwindow" to «event aevtrrst»'
else
  exit 1
fi
