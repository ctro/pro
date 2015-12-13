#!/usr/bin/env bash

echo "Installing Homebrew..."
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
echo "Checking Homebrew..."
brew doctor
brew update

echo "Installing brews..."
brew install ruby
brew install docker
brew install postgresql

echo "Installing casks..."
brew cask install iterm2
brew cask install google-chrome
brew cask install lastpass
brew cask install google-drive
brew cask install atom
brew cask install spectacle
brew cask install caffeine
brew cask install seil   # must manually set this up, i.e. CAPS->esc

echo "Configuring Gems..."
gem update –system
gem install bundler

#echo "Configuring OSX..."
#sh ./lib/ctro_osx.sh

echo "Configuring ENV..."
cp ./static/vimrc ~/.vimrc
cp ./static/bash_profile ~/.bash_profile
cp ./static/gitconfig ~/.gitconfig
cp ./static/gemrc ~/.gemrc

#reboot
