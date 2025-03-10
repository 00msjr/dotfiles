#!/bin/bash

set -e # Exit immediately if a command exits with a non-zero status

# Install Xcode CLI tools (macOS only)
if [[ "$(uname)" == "Darwin" ]]; then
  echo "macOS detected..."
  if ! xcode-select -p &>/dev/null; then
    echo "Installing Xcode Command Line Tools..."
    xcode-select --install
  else
    echo "Xcode Command Line Tools already installed."
  fi
fi

# Install Homebrew
if ! command -v brew &>/dev/null; then
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  brew analytics off
else
  echo "Homebrew already installed."
fi

# Tap necessary Homebrew repositories
echo "Tapping Homebrew repositories..."
brew tap homebrew/cask-fonts
brew tap FelixKratz/formulae

# Install essential packages
echo "Installing essential packages..."
brew install bat borders btop cava eza fd fzf git lazygit neofetch neovim tree-sitter zoxide zsh-syntax-highlighting

# Install makedir
brew install soup-ms/makedir/makedir

# Install developer tools
echo "Installing developer tools..."
brew install node python@3.12 pyenv rust

# Install GUI applications and fonts
echo "Installing GUI applications and fonts..."
brew install --cask background-music cheatsheet font-hack-nerd-font kitty obsidian vlc amazon-q

# Clone dotfiles repository
DOTFILES_DIR="$HOME/.config"
echo "Cloning dotfiles into $DOTFILES_DIR..."
git clone https://github.com/yourusername/dotfiles.git "$DOTFILES_DIR"

# Symlink dotfiles
echo "Symlinking configuration files..."
stow -d "$DOTFILES_DIR" -t "$HOME" bash fish nvim zsh lazygit sketchybar eza

# Move files and set up environment variables based on .zshrc
echo "Setting up Zsh configuration..."
mkdir -p "$HOME/.config/zsh/zsh-syntax-highlighting/themes"
mkdir -p "$HOME/Dev/scripts/hushterm"
mkdir -p "$HOME/Dev/scripts/rmdsstore"
mkdir -p "$HOME/.config/eza"
mkdir -p "$HOME/.config/dynamic-island-sketchybar/userconfigs"

mv ~/eza/colors.yaml "$HOME/.config/eza/colors.yaml"
mv ~/dynamic-island-sketchybar/userconfigs/1921monitor.sh "$HOME/.config/dynamic-island-sketchybar/userconfigs/"
mv ~/dynamic-island-sketchybar/userconfigs/mba2022_13.sh "$HOME/.config/dynamic-island-sketchybar/userconfigs/"

# Apply macOS UI and system settings
echo "Applying macOS UI settings..."
defaults write NSGlobalDomain AppleInterfaceStyle -string "Dark"
defaults write NSGlobalDomain AppleKeyboardUIMode -int 2
defaults write NSGlobalDomain AppleLocale -string "en_US"
defaults write NSGlobalDomain AppleMeasurementUnits -string "Inches"
defaults write NSGlobalDomain AppleTemperatureUnit -string "Fahrenheit"
defaults write com.apple.Dock autohide -bool true
defaults write com.apple.Dock magnification -bool true
defaults write com.apple.Dock tilesize -int 128
defaults write com.apple.finder ShowPathbar -bool true
defaults write com.apple.finder ShowStatusBar -bool true
defaults write com.apple.finder FXPreferredViewStyle -string "clmv"
defaults write NSGlobalDomain NSTableViewDefaultSizeMode -int 2
defaults write com.apple.menuextra.clock ShowDayOfWeek -bool true
defaults write com.apple.menuextra.clock ShowDate -bool false
defaults write com.apple.menuextra.clock ShowAMPM -bool true

# Restart affected services
echo "Restarting affected services..."
killall Dock
killall Finder

echo "Installation complete! Restart your terminal to apply changes."
