#!/bin/bash
# Sanity-checks the Java 25 demo's starting point: builds and tests this project as a genuine
# Java 21 project, before any Java 25 migration recipes have run. Run this against the
# `java25-migration-demo` branch to confirm the "before" state is a real, working Java 21 baseline.
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

# SDKMAN-managed JDK 21 home. Override if this exact candidate version drifts.
JDK21_HOME="${JDK21_HOME:-$HOME/.sdkman/candidates/java/21.0.10-librca}"

echo "=== Building and testing on JDK 21 ==="
JAVA_HOME="$JDK21_HOME" PATH="$JAVA_HOME/bin:$PATH" java -version
JAVA_HOME="$JDK21_HOME" PATH="$JAVA_HOME/bin:$PATH" ./mvnw clean verify
