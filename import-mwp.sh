#!/usr/bin/env bash
# ============================================================
# import-mwp.sh — Import a .mwp (Mafia Wiki Page) file into
# the wiki's docs/ directory.
#
# Usage:
#   ./import-mwp.sh <file.mwp>
#
# What it does:
#   1. Extracts the .mwp file (it's a renamed .zip)
#   2. Reads manifest.json to determine where to place the page
#   3. Copies page.md to docs/<suggestedPath>.md
#   4. Copies assets/ contents to docs/assets/
#   5. Prints a summary
# ============================================================

set -euo pipefail

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Check args
if [[ $# -lt 1 ]]; then
    echo -e "${RED}Usage:${NC} $0 <file.mwp>"
    echo "  Imports a Mafia Wiki Page file into the wiki's docs/ directory."
    exit 1
fi

MWP_FILE="$1"

if [[ ! -f "$MWP_FILE" ]]; then
    echo -e "${RED}Error:${NC} File not found: $MWP_FILE"
    exit 1
fi

# Check for unzip
if ! command -v unzip &> /dev/null; then
    echo -e "${RED}Error:${NC} 'unzip' is required but not installed."
    exit 1
fi

# Check for jq (optional but nice)
HAS_JQ=false
if command -v jq &> /dev/null; then
    HAS_JQ=true
fi

# Find the docs/ directory (relative to script or cwd)
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
DOCS_DIR=""

if [[ -d "$SCRIPT_DIR/docs" ]]; then
    DOCS_DIR="$SCRIPT_DIR/docs"
elif [[ -d "./docs" ]]; then
    DOCS_DIR="./docs"
else
    echo -e "${RED}Error:${NC} Cannot find docs/ directory. Run this from the wiki root."
    exit 1
fi

echo -e "${CYAN}=== Mafia Wiki Page Importer ===${NC}"
echo ""

# Create temp directory for extraction
TMP_DIR=$(mktemp -d)
trap "rm -rf $TMP_DIR" EXIT

# Extract the .mwp file (it's a .zip)
echo -e "Extracting ${YELLOW}$(basename "$MWP_FILE")${NC}..."
unzip -q "$MWP_FILE" -d "$TMP_DIR"

# Check for manifest.json
if [[ ! -f "$TMP_DIR/manifest.json" ]]; then
    echo -e "${RED}Error:${NC} Invalid .mwp file — missing manifest.json"
    exit 1
fi

# Check for page.md
if [[ ! -f "$TMP_DIR/page.md" ]]; then
    echo -e "${RED}Error:${NC} Invalid .mwp file — missing page.md"
    exit 1
fi

# Read manifest
if $HAS_JQ; then
    PAGE_TITLE=$(jq -r '.displayTitle // .title' "$TMP_DIR/manifest.json")
    PAGE_TYPE=$(jq -r '.type // "custom"' "$TMP_DIR/manifest.json")
    SUGGESTED_PATH=$(jq -r '.suggestedPath // ""' "$TMP_DIR/manifest.json")
    FILE_NAME=$(jq -r '.fileName // "page.md"' "$TMP_DIR/manifest.json")
    CREATED_AT=$(jq -r '.createdAt // "unknown"' "$TMP_DIR/manifest.json")
else
    # Fallback: basic grep parsing
    PAGE_TITLE=$(grep -oP '"displayTitle"\s*:\s*"\K[^"]+' "$TMP_DIR/manifest.json" || grep -oP '"title"\s*:\s*"\K[^"]+' "$TMP_DIR/manifest.json" || echo "Unknown")
    PAGE_TYPE=$(grep -oP '"type"\s*:\s*"\K[^"]+' "$TMP_DIR/manifest.json" || echo "custom")
    SUGGESTED_PATH=$(grep -oP '"suggestedPath"\s*:\s*"\K[^"]+' "$TMP_DIR/manifest.json" || echo "")
    FILE_NAME=$(grep -oP '"fileName"\s*:\s*"\K[^"]+' "$TMP_DIR/manifest.json" || echo "page.md")
    CREATED_AT=$(grep -oP '"createdAt"\s*:\s*"\K[^"]+' "$TMP_DIR/manifest.json" || echo "unknown")
fi

echo -e "  Title:   ${GREEN}$PAGE_TITLE${NC}"
echo -e "  Type:    $PAGE_TYPE"
echo -e "  Path:    $SUGGESTED_PATH"
echo -e "  Created: $CREATED_AT"
echo ""

# Determine target path
if [[ -n "$SUGGESTED_PATH" ]]; then
    TARGET_DIR="$DOCS_DIR/$(dirname "$SUGGESTED_PATH")"
    TARGET_FILE="$DOCS_DIR/${SUGGESTED_PATH}.md"
else
    TARGET_DIR="$DOCS_DIR"
    TARGET_FILE="$DOCS_DIR/$FILE_NAME"
fi

# Check if target already exists
if [[ -f "$TARGET_FILE" ]]; then
    echo -e "${YELLOW}Warning:${NC} Target file already exists: $TARGET_FILE"
    read -p "Overwrite? [y/N] " -n 1 -r
    echo ""
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        echo "Aborted."
        exit 0
    fi
fi

# Create target directory if needed
mkdir -p "$TARGET_DIR"

# Copy the page
cp "$TMP_DIR/page.md" "$TARGET_FILE"
echo -e "${GREEN}✓${NC} Page copied to: $TARGET_FILE"

# Copy assets
ASSET_COUNT=0
if [[ -d "$TMP_DIR/assets" ]]; then
    mkdir -p "$DOCS_DIR/assets"
    for asset in "$TMP_DIR/assets"/*; do
        if [[ -f "$asset" ]]; then
            ASSET_NAME=$(basename "$asset")
            if [[ -f "$DOCS_DIR/assets/$ASSET_NAME" ]]; then
                echo -e "  ${YELLOW}!${NC} Asset already exists, skipping: $ASSET_NAME"
            else
                cp "$asset" "$DOCS_DIR/assets/$ASSET_NAME"
                echo -e "  ${GREEN}+${NC} Asset: $ASSET_NAME"
                ((ASSET_COUNT++))
            fi
        fi
    done
fi

echo ""
echo -e "${GREEN}=== Import Complete ===${NC}"
echo -e "  Page:   $TARGET_FILE"
echo -e "  Assets: $ASSET_COUNT new file(s) added"
echo ""
echo -e "Run ${CYAN}mkdocs serve${NC} to preview the changes locally."
