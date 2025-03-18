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
brew tap soup-ms/drako

# Install essential packages
echo "Installing essential packages..."
brew install bat borders btop eza fd fzf git gh lazygit neofetch neovim tree-sitter zoxide zsh-syntax-highlighting clipboard glow stow mas sketchybar dynamic-island-sketchybar oh-my-posh spicetify-cli difftastic atuin ripgrep yazi fastfetch
brew install soup-ms/drako/drako

# Install developer tools
echo "Installing developer tools..."
brew install node python@3.12 pyenv rust lua gcc cmake vite tlrc rm-improved

# Install GUI applications and fonts
echo "Installing GUI applications and fonts..."
brew install --cask cheatsheet font-hack-nerd-font kitty vlc amazon-q ghostty raycast touchdesigner sf-symbols
mas install 424389933 634148309 # Final Cut Pro & Logic Pro

# Install LazyVim
echo "Installing LazyVim..."
git clone https://github.com/LazyVim/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git

# Clone dotfiles repository
CONFIG="$HOME/.config"
echo "Cloning dotfiles into $CONFIG..."
git clone https://github.com/soup-ms/dotfiles.git "$CONFIG"

# Symlink all configuration directories and files
echo "Symlinking all configuration files..."
mkdir -p "$HOME/.config"

# Use stow to manage all dotfiles and configurations
CONFIGS=(
  "dynamic-island-sketchybar"
  "sketchybar"
  "gh"
  "borders"
  "nvim"
  "lazygit"
  "omp-theme"
  ".obsidian"
  "yazi"
  "codewhisperer"
  "raycast"
  "scripts"
  ".ssh"
  "wallpaper"
  "eza"
  "btop"
  "bat"
  "cava"
  "atuin"
  "zsh"
  "fonts"
  "fish"
  "fastfetch"
  "fzf"
  "ghostty"
)

for config in "${CONFIGS[@]}"; do
  if [ -d "$CONFIG/$config" ]; then
    echo "Symlinking $config..."
    stow -d "$CONFIG" -t "$HOME/.config" "$config"
  fi
done

# Handle individual files
FILES=(
  ".gitignore"
  ".gitconfig"
  "README.md"
)

for file in "${FILES[@]}"; do
  if [ -f "$CONFIG/$file" ]; then
    echo "Copying $file..."
    cp "$CONFIG/$file" "$HOME/.config/$file"
  fi
done

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
