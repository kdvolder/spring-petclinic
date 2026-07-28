#!/bin/bash
# Builds the Java 25 recipe collection (org.openrewrite.java.migrate.UpgradeToJava25) from the
# spring-upgrade-recipes project and installs it into the local ~/.m2, on JDK 25 (the recipes'
# own build/tests don't need JDK 25, but this keeps the whole demo pipeline on one consistent JDK).
#
# Builds from the `java25-demo-recipes` branch, which merges in TNZ-113050 (StringReader) and
# TNZ-113051 (IO.println) on top of main - both expected to land on main by demo time, but not
# there yet. Once they've actually merged, point RECIPE_BRANCH at `main` instead.
#
# Progress goes to stderr; the resulting artifact version is the only thing printed to stdout, so
# callers can do: RECIPE_VERSION=$(./build-recipes.sh)
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"

# The spring-upgrade-recipes project that builds the recipe jars. Override with
# RECIPE_REPO=/path/to/spring-upgrade-recipes if this script is copied/moved elsewhere.
RECIPE_REPO="${RECIPE_REPO:-$REPO_ROOT/../..}"
RECIPE_BRANCH="${RECIPE_BRANCH:-java25-demo-recipes}"
JDK25_HOME="${JDK25_HOME:-$HOME/.sdkman/candidates/java/25.0.2-open}"

echo "=== Building Java 25 recipes from branch '$RECIPE_BRANCH' (on JDK 25) ===" >&2
ORIGINAL_RECIPE_BRANCH="$(git -C "$RECIPE_REPO" rev-parse --abbrev-ref HEAD)"
git -C "$RECIPE_REPO" checkout "$RECIPE_BRANCH" >&2

JAVA_HOME="$JDK25_HOME" PATH="$JAVA_HOME/bin:$PATH" \
    "$RECIPE_REPO/mvnw" -f "$RECIPE_REPO/pom.xml" -pl rewrite-migrate-java -am clean install \
    -DskipTests -Dlicense.skipUpdateLicense=true -Dlicense.skipDownloadLicenses=true -B >&2

RECIPE_VERSION=$(JAVA_HOME="$JDK25_HOME" PATH="$JAVA_HOME/bin:$PATH" \
    "$RECIPE_REPO/mvnw" -f "$RECIPE_REPO/pom.xml" help:evaluate -Dexpression=project.version -q -DforceStdout)

# Restore whatever branch was checked out in the recipes repo before we touched it.
git -C "$RECIPE_REPO" checkout "$ORIGINAL_RECIPE_BRANCH" >&2

echo "Recipe version: $RECIPE_VERSION" >&2
echo "$RECIPE_VERSION"
