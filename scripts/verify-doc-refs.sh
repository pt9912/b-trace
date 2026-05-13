#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

status=0

while IFS= read -r file; do
  while IFS= read -r link; do
    target="${link#*](}"
    target="${target%)}"

    case "$target" in
      http://*|https://*|mailto:*|"#"*|"")
        continue
        ;;
    esac

    target_path="${target%%#*}"
    if [ -z "$target_path" ]; then
      continue
    fi

    if [[ "$target_path" = /* ]]; then
      candidate=".$target_path"
    else
      candidate="$(dirname "$file")/$target_path"
    fi

    if [ ! -e "$candidate" ]; then
      printf 'Broken Markdown link in %s: %s -> %s\n' "$file" "$target" "$candidate" >&2
      status=1
    fi
  done < <(grep -oE '\[[^][]+\]\([^)]+\)' "$file" || true)
done < <(find README.md CHANGELOG.md spec docs -type f -name '*.md' 2>/dev/null | sort)

exit "$status"
