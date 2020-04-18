# .dotfiles
Personal dotfiles for macOS using a Git bare repository.

## Installation
You need to have Git installed.

To install Git with Homebrew:
```
# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# Install Git
brew install git
```

Then run the following:
```
git clone --bare https://github.com/bsdps7/.dotfiles.git $HOME/.dotfiles
git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME checkout
git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME config --local status.showUntrackedFiles no
```
