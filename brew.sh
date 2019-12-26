 #!/usr/bin/env bash

# Ask for administrator password upfront
sudo -v

# Update Homebrew
echo "Updating Homebrew..."
brew update

# Tap Homebrew Cask, Fonts, and Cask Versions
brew tap homebrew/cask
brew tap homebrew/cask-versions
brew tap homebrew/cask-fonts

# Install brew formulae
brew install zsh
sudo dscl . -create /Users/$USER UserShell /usr/local/bin/zsh
brew install zsh-autosuggestions
brew install zsh-syntax-highlighting

brew install wget
brew install htop
brew install mas

brew install git
brew install grep
brew install vim

# Install brew casks
brew cask install adoptopenjdk
brew cask install alfred
brew cask install discord
brew cask install dropbox
brew cask install google-chrome
brew cask install iterm2
brew cask install keepassxc
brew cask install rectangle
brew cask install sublime-text
brew cask install the-unarchiver
brew cask install tor-browser
brew cask install virtual-studio-code
brew cask install vlc

# Install brew cask fonts
brew cask install font-fira-code
brew cask install font-source-code-pro
brew cask install font-inconsolata
brew cask install font-roboto

# Cleanup
brew cleanup