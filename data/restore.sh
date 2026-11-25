#!/usr/bin/env bash
# 把本目录下的定制数据还原到 $DSH_HOME（覆盖前自动备份）
set -euo pipefail
HERE="$(cd "$(dirname "$0")" && pwd)"
HOMEDIR="${DSH_HOME:-$HOME/.dsh}"
TS="$(date +%Y%m%d-%H%M%S)"
mkdir -p "$HOMEDIR/dsh-purge/backups" "$HOMEDIR/dsh-purge/prompts"
[ -f "$HOMEDIR/prompt-inject.md" ] && cp "$HOMEDIR/prompt-inject.md" "$HOMEDIR/dsh-purge/backups/pre-restore-$TS.md"
cp "$HERE/prompt-inject.md"  "$HOMEDIR/prompt-inject.md"
cp "$HERE/categories.json"   "$HOMEDIR/dsh-purge/categories.json"
cp "$HERE/capabilities.md"   "$HOMEDIR/dsh-purge/capabilities.md"
cp "$HERE/raw.md"            "$HOMEDIR/dsh-purge/prompts/raw.md"
echo "已还原到 $HOMEDIR:"
wc -c "$HOMEDIR/prompt-inject.md" "$HOMEDIR/dsh-purge/categories.json" "$HOMEDIR/dsh-purge/capabilities.md"
