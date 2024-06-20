
show_tmux_kube() { # This function name must match the module name!
  local index icon color text module

  index=$1 # This variable is used internally by the module loader in order to know the position of this module

  icon="$(  get_tmux_option "@catppuccin_tmux_kube_icon"  ""           )"
  color="$( get_tmux_option "@catppuccin_tmux_kube_color" "$thm_gray" )"
  text="$(  get_tmux_option "@catppuccin_tmux_kube_text"  "#(/bin/bash /home/anttirae/.tmux/plugins/kube-tmux/kube.tmux 250 red cyan)" )"

  module=$( build_status_module "$index" "$icon" "$color" "$text" )

  echo "$module"
}
