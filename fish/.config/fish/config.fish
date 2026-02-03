# source /usr/share/cachyos-fish-config/cachyos-config.fish
fish_vi_key_bindings

# overwrite greeting
# potentially disabling fastfetch
#function fish_greeting
#    # smth smth
#end

# FUNCTIONS

function poweroff
  ~/.local/scripts/poweroff
end

# COMPLETIONS

if type -q kubectl
  kubectl completion fish | source
end
if type -q helm
  helm completion fish | source
end

# ALIASES

alias ll='lsd -lh'
alias l='lsd -l'
alias ls='lsd'
alias la='lsd -la'

alias vim='nvim'
alias vi='nvim'

alias rs='source ~/.config/fish/config.fish'

alias "C=xclip"
alias "v=xclip -o"
alias "c=xclip -selection clipboard"

alias k='kubectl'

alias gst='git status'

# EXPORTS

export PATH="$PATH:$HOME/go/bin"
export PATH="$PATH:$HOME/.local/scripts"

export EDITOR=nvim
export VISUAL=nvim


# krew
export PATH="$KREW_ROOT:-$HOME/.krew/bin:$PATH"

# pyenv
if type -q pyenv
  pyenv init - fish | source
end

## ATUIN
set -gx ATUIN_NOBIND "true"
atuin init fish | source

# bind to ctrl-r in normal and insert mode, add any other bindings you want here too
bind \cr _atuin_search
bind -M insert \cr _atuin_search
