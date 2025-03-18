# ===========================
# Amazon Q (Keep at the top)
# ===========================
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh"

# ===========================
# Launch Scripts
# ===========================
# Launch Script
source ~/Dev/scripts/hushterm/hushterm.sh; fastfetch

# Syntax Highlighting
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.config/zsh/zsh-syntax-highlighting/themes/catppuccin_mocha-zsh-syntax-highlighting.zsh

# ===========================
# Aliases
# ===========================
# Apps
alias vim='nvim'
alias sys='btop'                              # System monitor
alias bar='launchctl kickstart -k gui/501/com.felixkratz.sketchybar'
alias 1920='cb < ~/.config/dynamic-island-sketchybar/userconfigs/1920monitor.sh && cb > ~/.config/dynamic-island-sketchybar/userconfig.sh && sketchybar --reload'
alias mba='cb < ~/.config/dynamic-island-sketchybar/userconfigs/mba2022_13.sh && cb > ~/.config/dynamic-island-sketchybar/userconfig.sh && sketchybar --reload'
alias cleanup='sudo ~/Dev/scripts/cleanup/./cleanup.sh' # Clean up computer

# File and Directory Management
alias md='makedir -v'                         # Create directories recursively
alias img='kitty icat'                        # Display images in Kitty terminal
alias cat='bat --paging=never'                # Use `bat` instead of `cat`
alias cp='cb copy'
alias cpc='cb <'
alias p='cb paste'
alias pc='cb >'
alias d='difft'

# Configuration Shortcuts
alias zshrc='vim ~/.zshrc'      # Edit Zsh configuration
alias re='source ~/.zshrc'          # Reload Zsh config
alias nvimconfig='cd ~/.config/nvim/lua/'
alias obs='nvim ~/Docs/Obsidian/Vault/'

# Git
alias g='lazygit'
alias acp='(){git add . && git commit -m "$1" && git push}' # Quick commit and push
alias add='git add .'
alias commit='git commit -m'
alias push='git push'
alias pull='git pull'

# Navigation
alias cd='z'
alias l='eza --long --all --header --git --no-permissions --no-user --icons=always --color=always' # Enhanced `ls` replacement
alias tree='eza --tree --all --icons'
alias c='clear'                                   # Clear terminal
alias :q='exit'                                   # Vim-style exit
alias f='vim $(fzf)'

# Quick Directory Navigation
alias -g ~='cd ~'
alias -g /='cd /'
alias -g ..='cd ..'
alias -g ...='cd ../..'
alias -g ....='cd ../../..'
alias -g .....='cd ../../../..'
alias -g ......='cd ../../../../..'

# ===========================
# Function, Evals and Exports
# ===========================
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

eval "$(oh-my-posh init zsh --config ~/Dev/plugins/catppuccin-bubbles-omp-theme/catppuccin-bubbles.omp.json)"
eval "$(zoxide init zsh)"
eval "$(fzf --zsh)"
eval "$(atuin init zsh)"

# Path to .config
export XDG_CONFIG_HOME="$HOME/.config"
export CONFIG="$HOME/.config"

# Mocha theme for fzf
export FZF_DEFAULT_OPTS="$(cat ~/.config/fzf/config)"

# Set history file location
export HISTFILE="$ZDOTDIR/zshhistory/zsh_history"
export HISTSIZE=10000
export SAVEHIST=10000
setopt HIST_IGNORE_SPACE        # Don't record commands starting with a space
setopt HIST_IGNORE_DUPS        # Don't record duplicate commands
setopt APPEND_HISTORY          # Append to history instead of overwriting
setopt INC_APPEND_HISTORY      # Add commands to history as they are typed
setopt HIST_REDUCE_BLANKS      # Remove unnecessary blanks

# Bat theme (mocha)
export BAT_THEME="Catppuccin Mocha"

export EZA_CONFIG_DIR="$XDG_CONFIG_HOME/eza"

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
# Amazon Q (Keep at the bottom)
# ===========================
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh"
