function fish_prompt
        set -l last_status $status

        if not set -q __fish_git_prompt_show_informative_status
        set -g __fish_git_prompt_show_informative_status 1
        end
        if not set -q __fish_git_prompt_color_branch
        set -g __fish_git_prompt_color_branch brmagenta
        end
        if not set -q __fish_git_prompt_showupstream
        set -g __fish_git_prompt_showupstream "informative"
        end
        if not set -q __fish_git_prompt_showdirtystate
        set -g __fish_git_prompt_showdirtystate "yes"
        end
        if not set -q __fish_git_prompt_color_stagedstate
        set -g __fish_git_prompt_color_stagedstate yellow
        end
        if not set -q __fish_git_prompt_color_invalidstate
        set -g __fish_git_prompt_color_invalidstate red
        end
        if not set -q __fish_git_prompt_color_cleanstate
        set -g __fish_git_prompt_color_cleanstate brgreen
        end

        if not test $last_status -eq 0
        set_color $fish_color_error
        end
        # Set vi mode indicator with color
        set -l mode_indicator
        if test "$fish_bind_mode" = default
            set mode_indicator (set_color --bold red)'N'(set_color normal)
        else if test "$fish_bind_mode" = insert
            set mode_indicator (set_color --bold green)'I'(set_color normal)
        else if test "$fish_bind_mode" = visual
            set mode_indicator (set_color --bold yellow)'V'(set_color normal)
        else if test "$fish_bind_mode" = replace_one
            set mode_indicator (set_color --bold cyan)'R'(set_color normal)
        end
        echo -n $mode_indicator ""
        set_color normal
        #Save the return status of the previous command
        set -l last_pipestatus $pipestatus
        set -lx __fish_last_status $status # Export for __fish_print_pipestatus.

        if functions -q fish_is_root_user; and fish_is_root_user
                printf '%s@%s %s%s%s# ' $USER (prompt_hostname) (set -q fish_color_cwd_root
                                                                     and set_color $fish_color_cwd_root
                                                                     or set_color $fish_color_cwd) \
                        (prompt_pwd) (set_color normal)
        else
                set -l status_color (set_color $fish_color_status)
                set -l statusb_color (set_color --bold $fish_color_status)
                set -l pipestatus_string (__fish_print_pipestatus "[" "]" "|" "$status_color" "$statusb_color" $last_pipestatus)

                printf '[%s] %s%s@%s%s %s%s %s%s%s %s \n> ' (date "+%H:%M:%S") (set_color brblue) \
                        $USER (prompt_hostname) (fish_git_prompt) (set_color $fish_color_cwd) $PWD $pipestatus_string \
                        (set_color normal)
        end
end

function fish_mode_prompt
end
