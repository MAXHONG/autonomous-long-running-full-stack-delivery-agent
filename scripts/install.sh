#!/usr/bin/env bash
set -euo pipefail

OWNER="${OWNER:-MAXHONG}"
REPO="${REPO:-autonomous-long-running-full-stack-delivery-agent}"
REF="${REF:-main}"
SKILL_NAME="autonomous-long-running-full-stack-delivery-agent"

usage() {
  cat <<'EOF'
Usage: install.sh <platform> [--scope user|project] [--target-dir <path>]

Platforms:
  codex
  opencode
  claude-code
  openclaw
EOF
}

require_cmd() {
  if ! command -v "$1" >/dev/null 2>&1; then
    echo "Missing required command: $1" >&2
    exit 1
  fi
}

resolve_local_root() {
  local script_dir repo_root
  script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
  repo_root="$(cd "$script_dir/.." && pwd)"
  if [[ -d "$repo_root/packages" ]]; then
    printf '%s\n' "$repo_root"
    return 0
  fi
  return 1
}

download_remote_root() {
  require_cmd curl
  require_cmd tar
  local tmp_dir archive_url
  tmp_dir="$(mktemp -d)"
  archive_url="https://codeload.github.com/${OWNER}/${REPO}/tar.gz/refs/heads/${REF}"
  curl -fsSL "$archive_url" | tar -xzf - -C "$tmp_dir"
  printf '%s\n' "$tmp_dir/${REPO}-${REF}"
}

copy_dir() {
  local src="$1" dest="$2"
  mkdir -p "$(dirname "$dest")"
  rm -rf "$dest"
  cp -R "$src" "$dest"
}

copy_file() {
  local src="$1" dest="$2"
  mkdir -p "$(dirname "$dest")"
  cp "$src" "$dest"
}

PLATFORM="${1:-}"
shift || true

if [[ -z "$PLATFORM" ]]; then
  usage
  exit 1
fi

SCOPE="project"
TARGET_DIR=""

while [[ $# -gt 0 ]]; do
  case "$1" in
    --scope)
      SCOPE="${2:-}"
      shift 2
      ;;
    --target-dir)
      TARGET_DIR="${2:-}"
      shift 2
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      echo "Unknown argument: $1" >&2
      usage
      exit 1
      ;;
  esac
done

if ! REPO_ROOT="$(resolve_local_root 2>/dev/null)"; then
  REPO_ROOT="$(download_remote_root)"
fi

case "$PLATFORM" in
  codex)
    SRC="$REPO_ROOT/packages/codex/$SKILL_NAME"
    DEST="${TARGET_DIR:-$HOME/.codex/skills/$SKILL_NAME}"
    copy_dir "$SRC" "$DEST"
    ;;
  opencode)
    SRC="$REPO_ROOT/packages/opencode/.opencode/skills/$SKILL_NAME"
    if [[ -n "$TARGET_DIR" ]]; then
      DEST="$TARGET_DIR/$SKILL_NAME"
    elif [[ "$SCOPE" == "user" ]]; then
      DEST="$HOME/.config/opencode/skills/$SKILL_NAME"
    else
      DEST="$(pwd)/.opencode/skills/$SKILL_NAME"
    fi
    copy_dir "$SRC" "$DEST"
    ;;
  claude-code)
    SRC="$REPO_ROOT/packages/claude-code/.claude/agents/$SKILL_NAME.md"
    if [[ -n "$TARGET_DIR" ]]; then
      DEST="$TARGET_DIR/$SKILL_NAME.md"
    elif [[ "$SCOPE" == "user" ]]; then
      DEST="$HOME/.claude/agents/$SKILL_NAME.md"
    else
      DEST="$(pwd)/.claude/agents/$SKILL_NAME.md"
    fi
    copy_file "$SRC" "$DEST"
    ;;
  openclaw)
    SRC="$REPO_ROOT/packages/openclaw/skills/$SKILL_NAME"
    if [[ -n "$TARGET_DIR" ]]; then
      DEST="$TARGET_DIR/$SKILL_NAME"
    elif [[ "$SCOPE" == "user" ]]; then
      DEST="$HOME/.openclaw/skills/$SKILL_NAME"
    else
      DEST="$(pwd)/skills/$SKILL_NAME"
    fi
    copy_dir "$SRC" "$DEST"
    ;;
  *)
    echo "Unsupported platform: $PLATFORM" >&2
    usage
    exit 1
    ;;
esac

echo "Installed $SKILL_NAME for $PLATFORM at: $DEST"
