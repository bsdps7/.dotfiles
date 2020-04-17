#!/bin/sh

## Update Homebrew

echo "Updating Homebrew..."
brew update

## Tap Homebrew Cask, Fonts, and Cask Versions

brew tap homebrew/cask
brew tap homebrew/cask-versions
brew tap homebrew/cask-fonts

## Install formulae

brew install cmatrix
brew install cowsay
brew install fortune
#brew install neofetch
brew install pipes-sh
brew install tty-clock

#brew install ctags
#brew install htop
brew install jq
brew install mas
#brew install ncmpcpp
#brew install npm
brew install neovim
#brew install ranger
brew install skhd
brew install tmux
brew install tree
brew install wallpaper
brew install yabai
brew install ytop
brew install zsh-completions
brew install zsh-autosuggestions
brew install zsh-syntax-highlighting

#brew install coreutils
#brew install gnupg
#brew install coreutils
#brew install findutils
#brew install gawk
#brew install grep
#brew install wget

#brew install bash
#brew install curl
#brew install fzf
brew install git
brew install vim
brew install zsh

## Install casks

brew cask install alacritty --no-quarantine
#brew cask install adoptopenjdk --no-quarantine
brew cask install discord --no-quarantine 
brew cask install dropbox --no-quarantine
brew cask install eclipse-java --no-quarantine
brew cask install eloston-chromium --no-quarantine
brew cask install firefox --no-quarantine
brew cask install gimp --no-quarantine
brew cask install karabiner-elements --no-quarantine
brew cask install keepassxc --no-quarantine
brew cask install the-unarchiver --no-quarantine
brew cask install tor-browser --no-quarantine
#brew cask install transmission --no-quarantine
brew cask install ubersicht --no-quarantine
brew cask install visual-studio-code --no-quarantine
brew cask install virtualbox --no-quarantine
brew cask install vlc --no-quarantine

## Install fonts

brew cask install font-hack
brew cask install font-input
brew cask install font-iosevka
brew cask install font-mononoki
brew cask install font-roboto-mono
brew cask install font-sarasa-gothic
brew cask install font-ubuntu
brew cask install font-victor-mono

## Cleanup

brew cleanup
