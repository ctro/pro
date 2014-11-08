#!/usr/bin/env bash

# just ask for root...
sudo -v

echo "Installing Homebrew..."
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew doctor
echo "Updating Homebrew..."
brew update

echo "Installing Ruby..."
RV="2.1.4"
brew install rbenv ruby-build
rbenv install $RV
rbenv global $RV

echo "Installing brews..."
brew install postgresql
brew install heroku-toolbelt

echo "Installing casks..."
brew install caskroom/cask/brew-cask
brew cask install onepassword
brew cask install dropbox
brew cask install evernote
brew cask install google-chrome
brew cask install atom
#brew cask install alfred
brew cask install limechat
brew cask install torbrowser
brew cask install gitx
brew cask install handbrake
brew cask install fantastical
brew cask install utorrent
brew cask install spectacle
brew cask install rdio
brew cask install mailbox
brew cask install caffeine
brew cask install licecap

echo "Configuring Terminal..."
# Only use UTF-8 in Terminal.app
defaults write com.apple.terminal StringEncodings -array 4
brew install bash-completion

#Solarized themes
git clone git://github.com/tomislav/osx-lion-terminal.app-colors-solarized.git ~/.solarized-terminal
open ~/.solarized-terminal/Solarized\ Light.terminal
open ~/.solarized-terminal/Solarized\ Dark.terminal
sleep 1 # Wait a bit to make sure the theme is loaded
defaults write com.apple.terminal "Default Window Settings" -string "Solarized Dark"
defaults write com.apple.terminal "Startup Window Settings" -string "Solarized Dark"

echo "Configuring Gems..."
gem update –system
gem install bundler

echo "Installing keyboard bindings..."
brew cask install seil
#sh ./lib/seil-import.sh  <-- doesn't work for caps lock

echo "Configuring OSX..."
sh ./lib/ctro_osx.sh

echo "Configuring ENV..."
cp ./static/vimrc ~/.vimrc
cat /usr/share/vim/vim73/vimrc_example.vim >> ~/.vimrc
cp ./static/bash_profile ~/.bash_profile
cp ./static/gitconfig ~/.gitconfig
cp ./static/gemrc ~/.gemrc

echo "Run Installers..."
open /opt/homebrew-cask/Caskroom/utorrent/latest/uTorrent-Installer.app

#reboot
