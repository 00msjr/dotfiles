# Amazon Q pre block. Keep at the top of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh"
# Q pre block. Keep at the top of this file.

# OMP Prompt
eval "$(oh-my-posh init zsh)"

#OMP THEME
eval "$(oh-my-posh init zsh --config ~/Developer/plugins/catppuccin-bubbles-omp-theme/catppuccin-bubbles.omp.json)"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.config/zsh/.oh-my-zsh"

# Path to .config
export CONFIG="$XDG_CONFIG_HOME=$HOME/.config"

# Script to get rid of login message
source ~/Developer/scripts/hushterm/hushterm.sh

# Display Neofetch on each teminal instance
neofetch

# ZSH-syntax-highlighting theme
source ~/.config/zsh/zsh-syntax-highlighting/themes/catppuccin_mocha-zsh-syntax-highlighting.zsh

ZSH_THEME="simple" # set by `omz` DEFAULT="simple"

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="false"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
zstyle ':omz:update' frequency 7

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="false"

# Uncomment the following line to enable command auto-correction.
#ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# ZSH Plugins
plugins=(git fzf pip python rust gh eza brew bun npm zsh-syntax-highlighting you-should-use aliases arc-search zen-search zshcp)

source $ZSH/oh-my-zsh.sh

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='nvim'
 fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Aliases
# Apps
alias v='nvim'
alias love="/Applications/love.app/Contents/MacOS/love"
alias sys='btop'
alias bonsai='cbonsai -l -i'
alias matrix='cmatrix -s'
alias leetcode='v leetcode.nvim'
alias bar='brew services restart sketchybar'
alias 1920='cpfile ~/.config/dynamic-island-sketchybar/userconfigs/1920monitor.sh && psfile ~/.config/dynamic-island-sketchybar/userconfig.sh && sketchybar --reload'
alias mba='cpfile ~/.config/dynamic-island-sketchybar/userconfigs/mba2022_13.sh && psfile ~/.config/dynamic-island-sketchybar/userconfig.sh && sketchybar --reload'

# Commands
alias mdcd='(){mkdir $1 && cd $1}'
alias img='kitty icat'
alias cat='bat --paging=never'
alias zshconfig='v ~/.config/zsh/.zshrc'
alias config='v ~/.config'
alias r='source ~/.config/zsh/.zshrc'
alias c='clear'
alias :q='exit'
alias rm='trash'
alias link='ln -s'
alias rmds='~/Developer/scripts/rmdsstore/./rmdsstore.sh'
alias cp='cb copy'
alias ps='cb paste'
alias f='fzf'
alias commit='(){git add . && git commit -m "$1" && git push}'

function comit() {
    if [ -z "$1" ]; then
        echo "Usage: commit \"Your commit message here\""
        return 1
    fi
    git add .
    git commit -m "$1"
    git push
    echo "Committed and pushed with message: $1"
}

# Eza Theme
export EZA_COLORS_PATH="~/.config/eza/colors.yaml"

# bun completions
[ -s "/Users/mikey/.bun/_bun" ] && source "/Users/mikey/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Path to Rust
export PATH="$HOME/.cargo/bin:$PATH"

# Path to Py
export PATH="/opt/homebrew/bin/python3:$PATH"


[[ -f "$HOME/fig-export/dotfiles/dotfile.zsh" ]] && builtin source "$HOME/fig-export/dotfiles/dotfile.zsh"

export PATH=$PATH:/Users/mikey/.spicetify

# Amazon Q post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh"
