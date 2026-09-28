#!/bin/bash

ACTIVE_LOGS="active_logs"
REPORTS="reports"

HEART_RATE_LOG="$ACTIVE_LOGS/heart_rate.log"
TEMPERATURE_LOG="$ACTIVE_LOGS/temperature.log"
ALERTS_FILE="$REPORTS/critical_alerts.txt"

process_vitals() {
    echo "Scanning vitals for CRITICAL readings..."

    mkdir -p "$REPORTS"

    {
        echo "KNH Critical Alerts Report - Generated $(date)"
        printf "%-20s | %-15s | %-10s\n" "Timestamp" "Device_ID" "Value"
    } > "$ALERTS_FILE"

    if [ -f "$HEART_RATE_LOG" ]; then
        grep "CRITICAL" "$HEART_RATE_LOG" | awk -F',' '{ printf "%-20s | %-15s | %-10s\n", $1, $2, $3 }' >> "$ALERTS_FILE"
    fi

    if [ -f "$TEMPERATURE_LOG" ]; then
        grep "CRITICAL" "$TEMPERATURE_LOG" | awk -F',' '{ printf "%-20s | %-15s | %-10s\n", $1, $2, $3 }' >> "$ALERTS_FILE"
    fi

    echo "Report saved to $ALERTS_FILE"
}

process_vitals
 
  water_audit() {
     echo "===== WATER USAGE AUDIT ====="
       average=$(awk -F '|' '$2 ~ /ICU_WATER_RESERVE/ {
           gsub (/ /,"", $3)
           sum += $3
           count++
       } END {
           if (count > 0)
             print sum / count
           else 
             print 0
       }' active_logs/water_usage_log.log)
        printf "ICU Water Reserve Average Usage: %.2f Liters/min\n" "$average"
  }
