#!/usr/bin/env bash
set -euo pipefail

library_dir="$(cd "$(dirname "$0")" && pwd)"
source_file="$library_dir/SOURCES.tsv"

tail -n +2 "$source_file" | while IFS=$'\t' read -r slug year title doi pdf_url; do
    paper_dir="$library_dir/$slug"
    mkdir -p "$paper_dir"
    printf 'Downloading %s\n' "$slug"
    curl -L --fail --retry 3 --retry-delay 2 \
        -A 'Mozilla/5.0 (research archive; contact: local-user)' \
        "$pdf_url" -o "$paper_dir/paper.pdf" || {
            printf '%s\t%s\n' "$slug" "$pdf_url" >> "$library_dir/download-failures.tsv"
            rm -f "$paper_dir/paper.pdf"
        }
done
