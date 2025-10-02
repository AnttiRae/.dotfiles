#!/bin/bash

jira_tags=$(jira-issues)
local_tags=$(timew tags | tail -n +4 | awk '!/^[[:space:]]*$/' | cut -d " " -f 1)
all_tags="${jira_tags}/n${local_tags}"
tag=$(echo "$all_tags" | awk -F: '!seen[$1]++' | fzf --tmux center,30%,40%)
if [ -n "$tag" ]; then
    timew start "$(echo "$tag" | cut -d ":" -f 1)" &>/dev/null
fi


