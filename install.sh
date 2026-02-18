#!/bin/bash
DOTFILES="$(pwd)"
SCRIPT="$(basename "$0")"
EXCLUDES=(".git" ".gitignore" "README.md" ".claude" "$SCRIPT")

link() {
  local src="$1"
  local dst="$2"
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
      ln -sfv "$item" "$target"
    fi
  done
}

link "$DOTFILES" "$HOME"
