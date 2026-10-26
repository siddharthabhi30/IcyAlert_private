#!/usr/bin/env bash
set -euo pipefail

library_dir="$(cd "$(dirname "$0")" && pwd)"
source_file="$library_dir/SOURCES.tsv"

printf 'slug\tstatus\tpages\tbytes\n' > "$library_dir/pdf-audit.tsv"

tail -n +2 "$source_file" | while IFS=$'\t' read -r slug year title doi pdf_url; do
    paper_dir="$library_dir/$slug"
    pdf="$paper_dir/paper.pdf"
    dump="$paper_dir/paper-dump.md"

    if [[ ! -f "$pdf" ]]; then
        printf '%s\tmissing\t0\t0\n' "$slug" >> "$library_dir/pdf-audit.tsv"
        continue
    fi

    if ! pdfinfo "$pdf" >/dev/null 2>&1; then
        printf '%s\tnot-a-pdf\t0\t%s\n' "$slug" "$(stat -c %s "$pdf")" >> "$library_dir/pdf-audit.tsv"
        continue
    fi

    pages="$(pdfinfo "$pdf" | awk '/^Pages:/ {print $2}')"
    bytes="$(stat -c %s "$pdf")"
    text_tmp="$paper_dir/paper.txt"
    pdftotext -layout "$pdf" "$text_tmp"

    {
        printf '# Full-text extraction\n\n'
        printf -- '- Title: %s\n' "$title"
        printf -- '- Year: %s\n' "$year"
        printf -- '- DOI: https://doi.org/%s\n' "$doi"
        printf -- '- PDF source: %s\n' "$pdf_url"
        printf -- '- Extraction: `pdftotext -layout` from the verified local PDF\n\n'
        printf -- '---\n\n'
        sed 's/[[:space:]]\+$//' "$text_tmp"
    } > "$dump"
    rm -f "$text_tmp"

    chars="$(wc -c < "$dump")"
    if (( chars < 5000 )); then
        status="text-too-short-needs-ocr"
    else
        status="verified-and-extracted"
    fi
    printf '%s\t%s\t%s\t%s\n' "$slug" "$status" "$pages" "$bytes" >> "$library_dir/pdf-audit.tsv"
done
