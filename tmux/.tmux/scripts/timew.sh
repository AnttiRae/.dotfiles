if ! command -v timew >/dev/null 2>$1
then
    echo "timew not found"
    exit 0
fi

tag=$(timew tags | tail -n +4 | awk '!/^[[:space:]]*$/' | cut -d " " -f 1 | fzf --tmux center,20%,20%)
if [ -n "$tag" ]; then
  timew start "$tag" &>/dev/null
fi
