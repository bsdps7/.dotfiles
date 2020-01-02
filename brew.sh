#!/usr/bin/env bash

## Ask for administrator password upfront
sudo -v

## Update Homebrew
echo "Updating Homebrew..."
brew update

## Tap Homebrew Cask, Fonts, and Cask Versions
brew tap homebrew/cask
brew tap homebrew/cask-versions
brew tap homebrew/cask-fonts

## Install brew formulae
brew install bat
brew install htop
brew install mas
# brew install npm
brew install tmux
brew install tree
brew install wget
brew install zsh-completions
brew install zsh-autosuggestions
brew install zsh-syntax-highlighting

brew install coreutils
brew install findutils
brew install grep

brew install fzf
brew install git
brew install vim
brew install zsh

## Install brew casks
brew cask install alacritty --no-quarantine
brew cask install adoptopenjdk --no-quarantine
# brew cask install alfred --no-quarantine
brew cask install discord --no-quarantine
brew cask install dropbox --no-quarantine
brew cask install google-chrome --no-quarantine
brew cask install keepassxc --no-quarantine
# brew cask install rectangle --no-quarantine
# brew cask install sublime-text --no-quarantine
brew cask install the-unarchiver --no-quarantine
brew cask install tor-browser --no-quarantine
brew cask install visual-studio-code --no-quarantine
brew cask install vlc --no-quarantine

## Install brew cask fonts
# brew cask install font-fira-code
# brew cask install font-source-code-pro
# brew cask install font-roboto

## Cleanup
brew cleanup