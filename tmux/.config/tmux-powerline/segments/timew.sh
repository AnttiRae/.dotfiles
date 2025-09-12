# shellcheck shell=bash
# Print current timewarrior task

generate_segmentrc() {
  read -r -d '' rccontents <<EORC
EORC
  echo "$rccontents"
}

run_segment() {
  if command -v timew &>/dev/null; then
    current_task=$(timew | grep "Tracking" | awk '{print $2}')
    total=$(timew | grep "Total" | awk '{print $2}')
    echo $current_task: $total
  fi
}
