# .dotfiles
Personal dotfiles for macOS

## Installation
You need to have git installed.

To install git with Homebrew:
```
# Install Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew install git
```

Then run the following:
```
git clone --bare https://github.com/bsdps7/.dotfiles.git $HOME/.dotfiles
$(which git) --git-dir=$HOME/.dotfiles/ --work-tree=$HOME checkout
$(which git) --git-dir=$HOME/.dotfiles/ --work-tree=$HOME config --local status.showUntrackedFiles no
```
