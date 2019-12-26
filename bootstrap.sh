 #!/usr/bin/env bash

# Ask for administrator password upfront
sudo -v

# Update the OS
echo "Updating the OS..."
sudo softwareupdate -ia --verbose

# Install Homebrew if not found or update if found
if [[ $(which brew) == "" ]]; then
	echo "Installing Homebrew..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
	echo "Updating Homebrew..."
    brew update
fi

brew doctor