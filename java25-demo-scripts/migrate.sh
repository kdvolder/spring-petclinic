#!/bin/bash
# Runs the Java 25 upgrade recipe collection (org.openrewrite.java.migrate.UpgradeToJava25)
# against the project's current working tree. Does NOT reset or build/verify on its own - run
# reset.sh first, and build-before.sh/build-after.sh around this to get the full demo sequence
# (see full-demo.sh for all of it chained together).
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
cd "$REPO_ROOT"

JDK25_HOME="${JDK25_HOME:-$HOME/.sdkman/candidates/java/25.0.2-open}"

RECIPE_VERSION=$("$SCRIPT_DIR/build-recipes.sh")

echo "=== Running UpgradeToJava25 (must run on JDK 25 - the parser for _, IO.println, Reader.of needs it) ==="
JAVA_HOME="$JDK25_HOME" PATH="$JAVA_HOME/bin:$PATH" ./mvnw org.openrewrite.maven:rewrite-maven-plugin:6.44.0:run \
    -Drewrite.recipeArtifactCoordinates=com.vmware.tanzu.spring.recipes:rewrite-migrate-java:$RECIPE_VERSION \
    -Drewrite.activeRecipes=org.openrewrite.java.migrate.UpgradeToJava25

echo "=== Applying Spring Java Format ==="
JAVA_HOME="$JDK25_HOME" PATH="$JAVA_HOME/bin:$PATH" ./mvnw spring-javaformat:apply
