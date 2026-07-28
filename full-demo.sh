#!/bin/bash
# Convenience wrapper chaining the individual demo steps end-to-end. For an actual live demo,
# prefer running the individual scripts one at a time (reset-to-starting-point.sh,
# premigration-build-java21.sh, run-java25-migration.sh, postmigration-build-java25.sh) so you can
# narrate and inspect the diff between steps - this script is for a quick unattended full check.
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

./reset-to-starting-point.sh
./premigration-build-java21.sh
./run-java25-migration.sh
./postmigration-build-java25.sh

echo "=== Diff against starting point ==="
git diff java25-migration-demo --stat
