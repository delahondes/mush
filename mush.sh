mush() {
  if [ -z "$1" ]; then
    echo "Usage: mush <host> [mosh options]"
    return 1
  fi

  local host=$1
  shift

  # Derive deterministic color (0–255) from hostname
  local hash color
  hash=$(echo -n "$host" | cksum | awk '{print $1}')
  color=$((hash % 256))

  # Build tmux configuration safely (no empty values)
  local tmux_conf="
set -g status-position bottom
set -g status-bg colour${color}
set -g status-fg black
set -g status-interval 30

set -g status-left \"[\$(hostname -s)] \"
set -g status-justify left
set -g status-left-length 20
set -g status-right-length 50
set -g status-right '#[fg=black]%H:%M#[default]'

setw -g window-status-format '#I:#W'
setw -g window-status-current-format '#I:#W*'
"

  echo "→ Connecting to $host with tmux colour${color}..."
  mosh "$host" "$@" -- bash -lc "
    TMUX_TMP=\$(mktemp)
    printf '%s\n' \"$tmux_conf\" > \"\$TMUX_TMP\"
    tmux -f \"\$TMUX_TMP\" attach || tmux -f \"\$TMUX_TMP\" new -s main
    rm -f \"\$TMUX_TMP\"
  "
}
