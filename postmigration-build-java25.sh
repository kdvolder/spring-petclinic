#!/bin/bash
# Builds and tests this project on JDK 25, after the Java 25 migration recipes have run - proof
# that the migrated result actually works on the JDK it was migrated to.
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

JDK25_HOME="${JDK25_HOME:-$HOME/.sdkman/candidates/java/25.0.2-open}"

echo "=== Building and testing on JDK 25 ==="
JAVA_HOME="$JDK25_HOME" PATH="$JAVA_HOME/bin:$PATH" java -version
JAVA_HOME="$JDK25_HOME" PATH="$JAVA_HOME/bin:$PATH" ./mvnw clean verify
