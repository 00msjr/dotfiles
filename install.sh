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
brew tap soup-ms/makedir

# Install essential packages
echo "Installing essential packages..."
brew install bat borders btop cava eza fd fzf git gh lazygit neofetch neovim tree-sitter zoxide zsh-syntax-highlighting clipboard glow stow mas sketchybar dynamic-island-sketchybar oh-my-posh spicetify-cli
brew install soup-ms/makedir/makedir

# Install developer tools
echo "Installing developer tools..."
brew install node python@3.12 pyenv rust lua gcc cmake vite tlrc

# Install GUI applications and fonts
echo "Installing GUI applications and fonts..."
#brew install --cask background-music cheatsheet font-hack-nerd-font kitty obsidian vlc amazon-q ghostty raycast betterdiscord-installer touchdesigner spotify
#mas install 424389933 634148309 # Final Cut Pro & Logic Pro

# Install LazyVim
echo "Installing LazyVim..."
git clone https://github.com/LazyVim/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git

# Clone dotfiles repository
DOTFILES_DIR="$HOME/.config"
echo "Cloning dotfiles into $DOTFILES_DIR..."
git clone https://github.com/soup-ms/dotfiles.git "$DOTFILES_DIR"

# Symlink dotfiles
echo "Symlinking configuration files..."
stow -d "$DOTFILES_DIR" -t "$HOME/.config" bash fish nvim zsh lazygit sketchybar eza bat borders btop cava fd fzf git gh neofetch tree-sitter zoxide zsh-syntax-highlighting clipboard glow stow mas dynamic-island-sketchybar oh-my-posh spicetify-cli makedir

# Move files and set up environment variables based on .zshrc
echo "Setting up Zsh configuration..."
mkdir -p "$HOME/.config"

# Use stow to manage dotfiles and configurations
stow -d "$DOTFILES_DIR" -t "$HOME/.config" bash fish nvim zsh lazygit sketchybar eza bat borders btop cava fd fzf git gh neofetch tree-sitter zoxide zsh-syntax-highlighting clipboard glow stow mas dynamic-island-sketchybar oh-my-posh spicetify-cli makedir

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
