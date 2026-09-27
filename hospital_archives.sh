#!/bin/bash
# hospital_archive.sh
# Moves every file in active_logs into archived_logs with a timestamped
# filename, then recreates empty originals in active_logs so
# hospital_system.py can keep writing to them. Fresh move each run.

archive_logs() {
    local timestamp
    timestamp=$(date +%Y%m%d_%H%M)

    mkdir -p archived_logs active_logs

    shopt -s nullglob
    for file in active_logs/*; do
        [[ -f "$file" ]] || continue

        local filename name ext new_name
        filename=$(basename "$file")
        name="${filename%.*}"
        ext="${filename##*.}"
        new_name="${name}_${timestamp}.${ext}"

        mv "$file" "archived_logs/$new_name"
        echo "Archived $filename -> archived_logs/$new_name"

        touch active_logs/heart_rate.log active_logs/temperature.log active_logs/water_usage.log
        echo "Recreated empty active_logs/$filename"
    done
    shopt -u nullglob

    echo "Archive complete: $timestamp"
}

archive_logs
