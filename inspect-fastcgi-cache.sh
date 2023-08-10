#!/bin/bash
###################################################################
# this script is used to inspect Centmin Mod Nginx Wordpress configured
# fastcgi_cache based guest full HTML page cached files in defined
# fastcgi_cache_path directory /home/fastcgicache_wp/yourdomaincom
# where yourdomaincom refers to domain name yourdomain.com
#
# script inspects the last 3 file mapped cached entries
#
# Usage
#
# ./inspect_cache.sh --cache-path "/home/fastcgicache_wp/yourdomaincom"
###################################################################

# Default value for entries to inspect
ENTRIES_TO_INSPECT=3

# Parse command line arguments
while [[ "$#" -gt 0 ]]; do
    case $1 in
        --cache-path)
            CACHE_PATH="$2"
            shift
            ;;
        *)
            echo "Unknown parameter passed: $1"
            exit 1
            ;;
    esac
    shift
done

# Check if the specified path exists
if [[ ! -d "$CACHE_PATH" ]]; then
    echo "The specified cache path does not exist: $CACHE_PATH"
    exit 1
fi

# Find the last $ENTRIES_TO_INSPECT files
LAST_ENTRIES=$(find "$CACHE_PATH" -type f -printf '%T@ %p\n' | sort -n | tail -n "$ENTRIES_TO_INSPECT" | cut -f2- -d' ')

if [[ -z "$LAST_ENTRIES" ]]; then
    echo "No cache entry found."
    exit 1
fi

# Loop through each entry and display its details and content
while read -r ENTRY; do
    echo "==================================="
    ls -lah "$ENTRY"
    echo "-----------------------------------"
    echo "Contents:"
    cat "$ENTRY" | head -n7
    echo
done <<< "$LAST_ENTRIES"

exit 0
