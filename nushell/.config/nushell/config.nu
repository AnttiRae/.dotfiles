

$env.config.edit_mode = 'vi'
$env.config.buffer_editor = 'nvim'
# ALIASES

alias ll = ls -lh
alias l = ls -l
alias ls = ls
alias la = ls -la

alias .. = cd ..

alias vim = nvim

alias C = xclip
alias v = xclip -o
alias c = xclip -selection clipboard

alias ta = tmux attach-session

alias k = kubectl

overlay use ./plugins/git-aliases.nu/git-aliases.nu


