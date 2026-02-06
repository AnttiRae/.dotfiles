fish_vi_key_bindings

# overwrite greeting
function fish_greeting
#    # smth smth
end

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

abbr -a -- - 'cd -'

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

# fzf theme

set -Ux FZF_DEFAULT_OPTS '
  --color=fg:#6e858c,fg+:#ffeded,bg:#181d1e,bg+:#262626
  --color=hl:#dadada,hl+:#5596ab,info:#606672,marker:#91d049
  --color=prompt:#809766,spinner:#af5fff,pointer:#a2b4d5,header:#87afaf
  --color=gutter:#181d1e,border:#48573d,separator:#48573d,preview-border:#5c5a5a
  --color=label:#aeaeae,query:#d9d9d9
  --preview-window="border-rounded" --prompt="> " --marker=">" --pointer="◆"
  --separator="─" --scrollbar="│"'

# krew
set -gx PATH $PATH $HOME/.krew/bin


if type -q zoxide
  zoxide init fish | source
end

# pyenv
if type -q pyenv
  pyenv init - fish | source
end

# direnv

if type -q direnv
  direnv hook fish | source
end

## ATUIN
set -gx ATUIN_NOBIND "true"
atuin init fish | source

# bind to ctrl-r in normal and insert mode, add any other bindings you want here too
bind \cr _atuin_search
bind -M insert \cr _atuin_search
