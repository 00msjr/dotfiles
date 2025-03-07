# ===========================
# Amazon Q (Keep at the top)
# ===========================
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh"

# ===========================
# Prompt and Theming
# ===========================
# Oh My Posh
eval "$(oh-my-posh init zsh --config ~/Developer/plugins/catppuccin-bubbles-omp-theme/catppuccin-bubbles.omp.json)"
eval "$(zoxide init zsh)"

# Syntax Highlighting
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.config/zsh/zsh-syntax-highlighting/themes/catppuccin_mocha-zsh-syntax-highlighting.zsh

# ===========================
# Paths and Environment Variables
# ===========================
# Path to .config
export XDG_CONFIG_HOME="$HOME/.config"

# ===========================
# External Scripts
# ===========================
# Suppress login messages
source ~/Developer/scripts/hushterm/hushterm.sh

# Rust
export PATH="$HOME/.cargo/bin:$PATH"

# Python (Homebrew installation)
export PATH="/opt/homebrew/bin/python3:$PATH"

# Bun (JavaScript runtime)
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Spicetify (Spotify theming tool)
export PATH=$PATH:/Users/mikey/.spicetify

# Eza (ls replacement) theme path
export EZA_COLORS_PATH="$HOME/.config/eza/colors.yaml"

# Bun auto-completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# Fig dotfiles (if exists)
[[ -f "$HOME/fig-export/dotfiles/dotfile.zsh" ]] && builtin source "$HOME/fig-export/dotfiles/dotfile.zsh"

# ===========================
# System Info on Launch
# ===========================
neofetch

# ===========================
# Default Editor (Vim for SSH, Neovim locally)
# ===========================
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# ===========================
# Aliases
# ===========================
# Apps
alias v='nvim'                                # Open Neovim
alias vim='nvim'
alias love="/Applications/love.app/Contents/MacOS/love"  # LÖVE game engine
alias sys='btop'                              # System monitor
alias bonsai='cbonsai -l -i'                  # Cool ASCII bonsai
alias matrix='cmatrix -s'                     # Matrix effect
alias leetcode='vim leetcode.nvim'            # Open Leetcode plugin in Neovim
alias bar='brew services restart sketchybar'  # Restart Sketchybar
alias 1920='cpfile ~/.config/dynamic-island-sketchybar/userconfigs/1920monitor.sh && psfile ~/.config/dynamic-island-sketchybar/userconfig.sh && sketchybar --reload'
alias mba='cpfile ~/.config/dynamic-island-sketchybar/userconfigs/mba2022_13.sh && psfile ~/.config/dynamic-island-sketchybar/userconfig.sh && sketchybar --reload'

# File and Directory Management
alias md='makedir'                            # Create directories recursively
alias rm='trash'                              # Move to trash instead of delete
alias img='kitty icat'                        # Display images in Kitty terminal
alias cat='bat --paging=never'                # Use `bat` instead of `cat`
alias link='ln -s'                            # Create symbolic links
alias rmds='~/Developer/scripts/rmdsstore/./rmdsstore.sh' # Remove `.DS_Store` files
alias cp='cb copy'
alias ps='cb paste'

# Configuration Shortcuts
alias zshconfig='vim ~/.config/zsh/.zshrc'      # Edit Zsh configuration
alias config='vim ~/.config'                    # Open config folder
alias re='source ~/.config/zsh/.zshrc'          # Reload Zsh config

# Git
alias commit='(){git add . && git commit -m "$1" && git push}' # Quick commit and push

# Navigation
alias cd='z'
alias l='eza --long --all --header --icons --git' # Enhanced `ls` replacement
alias tree='eza --tree --all --icons'
alias c='clear'                                   # Clear terminal
alias :q='exit'                                   # Vim-style exit
alias f='fzf'                                     # Fuzzy finder

# Quick Directory Navigation
alias -g ~='cd ~'
alias -g /='cd /'
alias -g ..='cd ..'
alias -g ...='cd ../..'
alias -g ....='cd ../../..'
alias -g .....='cd ../../../..'
alias -g ......='cd ../../../../..'

# ===========================
# Amazon Q (Keep at the bottom)
# ===========================
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh"
