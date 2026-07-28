#!/bin/bash
# Rewinds this project back to the prepared Java 25 demo starting point, discarding whatever the
# migration recipes (or anything else) did on top of it. Safe to run before every demo take.
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

echo "=== Resetting to java25-migration-demo starting point ==="
git checkout java25-migration-demo
git reset --hard java25-migration-demo
git clean -fd
