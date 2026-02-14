autoload -Uz compinit && compinit
zstyle ':completion:*' menu select
setopt AUTO_CD # Just type a directory name to 'cd' into it

# History Settings
HISTFILE=~/.zsh_history
HISTSIZE=50000
SAVEHIST=50000
setopt HIST_IGNORE_ALL_DUPS 
setopt SHARE_HISTORY
setopt INC_APPEND_HISTORY
setopt APPEND_HISTORY

# Aliases
alias ll='ls -alF --color=auto'
alias la='ls -A --color=auto'
alias l='ls -CF --color=auto'
alias cls='clear'
alias clip='xclip -selection clipboard'
alias grep='grep --color=auto'
alias ip='ip -c a'
alias john='/home/namura/john-jumbo/run/john'
alias code="flatpak run com.vscodium.codium"

# Functions 
# Modern Cheat Sheet
cht() {
    curl -s "cht.sh/$1" | less -R
}

# Notification on long jobs
alert() {
    local exit_status=$?
    local icon=$([ $exit_status = 0 ] && echo "terminal" || echo "error")
    notify-send --urgency=low -i "$icon" "Task Finished"
}

# Create and Enter dir
mkt() {
    mkdir -p "$1" && cd "$1"
}

# ---- Tool Version Managers ----
# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# SDKMAN
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# Rust/Cargo
[ -f "$HOME/.cargo/env" ] && source "$HOME/.cargo/env"


# Bindings
bindkey "^[[1;5D" backward-word
bindkey "^[[1;5C" forward-word

# Plugins & Highlighting
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Starship
eval "$(starship init zsh)"
