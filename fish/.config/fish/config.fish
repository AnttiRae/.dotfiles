fish_vi_key_bindings

function fish_greeting
end

function k9s
    TERM=xterm-256color command k9s $argv
end


# PATH

fish_add_path -p "$HOME/go/bin"
fish_add_path -p "$HOME/.local/scripts"

set -x EDITOR nvim
set -x VISUAL nvim

# fzf theme

set -Ux FZF_DEFAULT_OPTS '
  --color=fg:#6e858c,fg+:#ffeded,bg:#181d1e,bg+:#262626
  --color=hl:#dadada,hl+:#5596ab,info:#606672,marker:#91d049
  --color=prompt:#809766,spinner:#af5fff,pointer:#a2b4d5,header:#87afaf
  --color=gutter:#181d1e,border:#48573d,separator:#48573d,preview-border:#5c5a5a
  --color=label:#aeaeae,query:#d9d9d9
  --preview-window="border-rounded" --prompt="> " --marker=">" --pointer="◆"
  --separator="─" --scrollbar="│"'

status is-interactive; and begin
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

  # Hydro theme
  set --global hydro_multiline true
  set --global fish_prompt_pwd_dir_length 100
  set hydro_color_pwd $fish_color_command
  set hydro_color_git $fish_color_command
  set hydro_color_error $fish_color_error
  set hydro_color_prompt --dim $fish_color_command
  set hydro_color_duration --dim $fish_color_command

end
