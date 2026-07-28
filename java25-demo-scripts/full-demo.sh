#!/bin/bash
# Convenience wrapper chaining the individual demo steps end-to-end. For an actual live demo,
# prefer running the individual scripts one at a time (reset.sh, build-before.sh, migrate.sh,
# build-after.sh) so you can narrate and inspect the diff between steps - this script is for a
# quick unattended full check.
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"

"$SCRIPT_DIR/reset.sh"
"$SCRIPT_DIR/build-before.sh"
"$SCRIPT_DIR/migrate.sh"
"$SCRIPT_DIR/build-after.sh"

echo "=== Diff against starting point ==="
git -C "$REPO_ROOT" diff java25-migration-demo --stat
