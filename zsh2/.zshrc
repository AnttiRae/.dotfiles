autoload -Uz compinit
compinit

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

# A glance at the new for-syntax – load all of the above
# plugins with a single command. For more information see:
# https://zdharma-continuum.github.io/zinit/wiki/For-Syntax/
zinit for \
  zsh-users/zsh-autosuggestions \
  zdharma-continuum/fast-syntax-highlighting \
  https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/git/git.plugin.zsh \

eval "$(starship init zsh)"

zinit ice depth=1
zinit light jeffreytse/zsh-vi-mode

source <(kubectl completion zsh)
source <(helm completion zsh)

export PATH=$PATH:$(go env GOPATH)/bin
export EDITOR=nvim
export VISUAL=nvim

# ALIASES

alias ll='lsd -lh'
alias l='lsd -l'
alias ls='lsd'
alias la='lsd -la'

alias ..="cd .."
alias -- -="cd -"

alias vim='nvim'

alias rs='source ~/.zshrc'

alias "C=xclip"
alias "v=xclip -o"
alias "c=xclip -selection clipboard"

alias ta='tmux attach-session'

alias k='kubectl'

export PATH="$PATH:$HOME/.local/share/JetBrains/Toolbox/scripts"
export PATH="$PATH:$HOME/go/bin"
export PATH="$PATH:$HOME/.local/scripts"
export PATH="$PATH:$HOME/Scripts"
eval "$(direnv hook zsh)"
eval "$(zoxide init zsh)"
. "$HOME/.atuin/bin/env"
eval "$(atuin init zsh)"

export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/arae/google-cloud-sdk/path.zsh.inc' ]; then . '/home/arae/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/arae/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/arae/google-cloud-sdk/completion.zsh.inc'; fi

# FUNCTIONS

irebase() {
  local base="${1:-main}"
  git rebase -i $(git merge-base $base HEAD)
}

tns() {
  local session_name=$1
  if [[ -z "$session_name" ]]; then
    read -r "session_name?Enter session name: "
    if [[ -z "$session_name" ]]; then
      echo "Error: session name required." >&2
      return 1
    fi
  fi
  tmux new-session -d -s "$session_name"
}


# Created by `pipx` on 2025-08-21 11:48:18
export PATH="$PATH:/home/arae/.local/bin"

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"

