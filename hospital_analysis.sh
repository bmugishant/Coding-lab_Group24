#!/bin/bash
# hospital_analysis.sh
# process_vitals(): scans heart rate and temperature logs in active_logs
# for CRITICAL entries, extracts Timestamp, Device_ID, Value, and appends
# them to reports/critical_alerts.txt.
#
# ASSUMPTION: logs are space- or comma-separated with columns in order:
# Timestamp, Device_ID, Value, Status. Confirm the real format once you
# have a sample line from hospital_system.py, and adjust below if needed.

process_vitals() {
    local heart_rate_log="active_logs/heart_rate.log.log"
    local temperature_log="active_logs/temperature.log.log"
    local output_file="reports/critical_alerts.txt"

    mkdir -p reports

    for log_file in "$heart_rate_log" "$temperature_log"; do
        if [[ -f "$log_file" ]]; then
            echo "Scanning $log_file for CRITICAL entries..."
            grep "CRITICAL" "$log_file" | awk -F' \| ' ' '{print $1, $2, $3}' >> "$output_file"
        else
            echo "Warning: $log_file not found, skipping."
        fi
    done

    echo "Critical alerts appended to $output_file"
}

process_vitals
