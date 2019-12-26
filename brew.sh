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

# Install newer zsh from Homebrew then change shell to it
brew install zsh
sudo dscl . -create /Users/$USER UserShell /usr/local/bin/zsh

# Install oh-my-zsh and the plugins zsh-autosuggestions and zsh-syntax-highlighting
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --noreplace-rc
brew install zsh-autosuggestions
brew install zsh-syntax-highlighting

# Install more Homebrew formulae
brew install wget
brew install htop
brew install mas

brew install git
brew install grep
brew install vim

# Install brew casks
brew cask install adoptopenjdk --no-quarantine
brew cask install alfred --no-quarantine
brew cask install discord --no-quarantine
brew cask install dropbox --no-quarantine
brew cask install google-chrome --no-quarantine
brew cask install iterm2 --no-quarantine
brew cask install keepassxc --no-quarantine
brew cask install rectangle --no-quarantine
brew cask install sublime-text --no-quarantine
brew cask install the-unarchiver --no-quarantine
brew cask install tor-browser --no-quarantine
brew cask install visual-studio-code --no-quarantine
brew cask install vlc --no-quarantine

# Install brew cask fonts
brew cask install font-fira-code
brew cask install font-source-code-pro
brew cask install font-inconsolata
brew cask install font-roboto

# Cleanup
brew cleanup
