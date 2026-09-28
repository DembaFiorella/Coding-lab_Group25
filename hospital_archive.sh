#!/bin/bash

ACTIVE_LOGS="active_logs"
ARCHIVED_LOGS="archived_logs"

LOG_NAMES=("heart_rate.log" "temperature.log" "water_usage.log")

rotate_logs() {
    echo "Rotating KNH sensor logs..."

    mkdir -p "$ARCHIVED_LOGS"

    local stamp
    stamp=$(date +%Y%m%d_%H%M)

    for log in "${LOG_NAMES[@]}"; do
        local source="$ACTIVE_LOGS/$log"
        local base="${log%.log}"
        local dest="$ARCHIVED_LOGS/${base}_${stamp}.log"

        if [ -f "$source" ] && [ -s "$source" ]; then
            mv "$source" "$dest"
            echo "Archived: $source -> $dest"
        elif [ -f "$source" ]; then
            echo "Skipped $source (already empty)."
        else
            echo "WARNING: $source not found."
        fi

        touch "$source"
        echo "Recreated empty log: $source"
    done

    echo "Log rotation complete."
}

rotate_logs
