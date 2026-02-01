source /usr/share/cachyos-fish-config/cachyos-config.fish
fish_vi_key_bindings

# overwrite greeting
# potentially disabling fastfetch
#function fish_greeting
#    # smth smth
#end

# COMPLETIONS

if type -q kubectl
  kubectl completion zsh | source
end
if type -q helm
  helm completion zsh | source
end

# ALIASES

alias ll='lsd -lh'
alias l='lsd -l'
alias ls='lsd'
alias la='lsd -la'

alias vim='nvim'
alias vi='nvim'

# alias rs='source ~/.config/fish/config.fish'

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
  export PYENV_ROOT="$HOME/.pyenv"
  [[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init - zsh)"
end
