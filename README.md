# .dotfiles
Personal dotfiles for macOS using a Git bare repository.

## Installation
You need to have Git installed.

To install Git with Homebrew:
```
# Install Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install Git
brew install git
```

Then run the following:
```
git clone --bare https://github.com/bsdps7/.dotfiles.git $HOME/.dotfiles
$(which git) --git-dir=$HOME/.dotfiles/ --work-tree=$HOME checkout
$(which git) --git-dir=$HOME/.dotfiles/ --work-tree=$HOME config --local status.showUntrackedFiles no
source $HOME/.zshrc
```
