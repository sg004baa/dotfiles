#!/bin/bash
DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SCRIPT="$(basename "$0")"
EXCLUDES=(".git" ".gitignore" "README.md" ".claude" "$SCRIPT")

link() {
  local src="$1"
  local dst="$2"

  local dst_real
  dst_real="$(realpath -m "$dst")"
  [[ "$dst_real" == "$DOTFILES" || "$dst_real" == "$DOTFILES/"* ]] && return

  for item in "$src"/.[^.]* "$src"/*; do
    [[ -e "$item" ]] || continue
    local name=$(basename "$item")
    [[ " ${EXCLUDES[*]} " == *" $name "* ]] && continue
    local target="$dst/$name"
    if [[ -d "$item" && -d "$target" && ! -L "$target" ]]; then
      link "$item" "$target"
    elif [[ -e "$target" && ! -L "$target" ]]; then
      echo "WARNING: skipped (already exists): $target" >&2
    else
      ln -sfnv "$item" "$target"
    fi
  done
}

link "$DOTFILES" "$HOME"
