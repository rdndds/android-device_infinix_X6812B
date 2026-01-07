#!/bin/bash

set -e

DELETE=false

while [ "${#}" -gt 0 ]; do
    case "${1}" in
        -d | --delete )
                DELETE=true
                ;;
        * )
                ;;
    esac
    shift
done

MY_DIR="${BASH_SOURCE%/*}"
if [[ ! -d "${MY_DIR}" ]]; then MY_DIR="${PWD}"; fi

MISSING_FILE="${MY_DIR}/missing.txt"
PROPRIETARY_FILE="${MY_DIR}/proprietary-files.txt"
BACKUP_FILE="${MY_DIR}/proprietary-files.txt.bak"

if [ ! -f "$MISSING_FILE" ]; then
    echo "Error: $MISSING_FILE not found"
    exit 1
fi

if [ ! -f "$PROPRIETARY_FILE" ]; then
    echo "Error: $PROPRIETARY_FILE not found"
    exit 1
fi

grep '!!' "$MISSING_FILE" | sed 's/.*!! //' | sed 's/: file not found in source//' | sort -u > /tmp/missing_files.txt

if [ ! -s /tmp/missing_files.txt ]; then
    echo "No missing files found"
    exit 0
fi

TOTAL_MISSING=$(wc -l < /tmp/missing_files.txt)
echo "Found $TOTAL_MISSING missing files in missing.txt:"

FOUND_COUNT=0
while IFS= read -r file; do
    if [ -n "$file" ] && grep -q "^$file$" "$PROPRIETARY_FILE"; then
        echo "  - $file"
        ((FOUND_COUNT++))
    fi
done < /tmp/missing_files.txt

if [ "$DELETE" = true ]; then
    echo ""
    echo "Deleting $FOUND_COUNT files from proprietary-files.txt..."

    cp "$PROPRIETARY_FILE" "$BACKUP_FILE"
    echo "Backup created: $BACKUP_FILE"

    while IFS= read -r file; do
        if [ -n "$file" ]; then
            escaped_file=$(printf '%s\n' "$file" | sed 's/[[\.*^$()+?{|\\]/\\&/g')
            grep -v "^$escaped_file$" "$PROPRIETARY_FILE" > /tmp/proprietary_temp.txt
            if [ $(wc -l < "$PROPRIETARY_FILE") -ne $(wc -l < /tmp/proprietary_temp.txt) ]; then
                mv /tmp/proprietary_temp.txt "$PROPRIETARY_FILE"
            else
                rm /tmp/proprietary_temp.txt
            fi
        fi
    done < /tmp/missing_files.txt

    REMOVED_LINES=$(($(wc -l < "$BACKUP_FILE") - $(wc -l < "$PROPRIETARY_FILE")))
    echo "Removed $REMOVED_LINES lines from proprietary-files.txt"
    echo "Done. Original file backed up to $BACKUP_FILE"
else
    echo ""
    echo "Use -d or --delete to remove these files"
fi

rm /tmp/missing_files.txt
