#!/bin/bash
# hospital_analysis.sh
# process_vitals(): scans heart rate and temperature logs in active_logs
# for CRITICAL entries, extracts Timestamp, Device_ID, Value, and appends
# them to reports/critical_alerts.txt.

process_vitals() {
    local heart_rate_log="active_logs/heart_rate_log.log"
    local temperature_log="active_logs/temperature_log.log"
    local output_file="reports/critical_alerts.txt"

    mkdir -p reports

    for log_file in "$heart_rate_log" "$temperature_log"; do
        if [[ -f "$log_file" ]]; then
            grep "CRITICAL" "$log_file" | awk -F' \| ' '{print $1, $2, $3}' >> "$output_file"
        else
            echo "Warning: $log_file not found, skipping."
        fi
    done

    echo "Critical alerts appended to $output_file"
}

water_audit() {
    local water_usage_file="active_logs/water_usage_log.log"

    if [[ ! -f "$water_usage_file" ]]; then
        echo "Error: water usage file not found"
        return 1
    fi

    local average
    average=$(awk -F' \| ' '$2 == "ICU_WATER_RESERVE" {sum += $3; count++} END {
        if (count > 0)
            printf "%.2f", sum / count
        else
            printf "0.00"
    }' "$water_usage_file")

    printf "\n--- WATER USAGE AUDIT ---\n"
    printf "Resource: ICU_WATER_RESERVE\n"
    printf "Average Water Usage: %s\n" "$average"
    printf "----------\n"
}

process_vitals
water_audit
