# Coding-lab_Group24
First group repository
# Hospital Data Management System

## Project Overview

This project simulates a hospital monitoring and data-management environment.
It runs a background Python service (`hospital_system.py`) that continuously
logs vital signs and facility data (e.g. heart rate, temperature, ICU water
reserve usage) into log files. A set of Bash scripts handle environment
setup, security, clinical alert analysis, and log archiving around that
service.

Briefly describe the goal of the project here, e.g.:
> This system was built to demonstrate automated healthcare log monitoring,
> including real-time alerting on critical vitals and safe long-term
> archiving of patient monitoring data.

## Group Roles

| Name | Role | Responsibilities |
|------|------|-------------------|
| Benjamin Mugisha Ntege | Architect & Group Lead | Designed `hospital_admin.sh` structure, wrote `initialize_system()`, defined how `hospital_system.py` is started/stopped |
| Mussab Atif Ibrahim Abdelgadir | Security & Orchestration | Wrote `secure_data()` (directory permissions), wrote the main execution logic tying the script together |
| Mucyo Kayibnda Blaise | Clinical Analysis & Archiving | Wrote `hospital_analysis.sh` (`process_vitals()`) and `hospital_archive.sh` for log rotation |
| Eden Ganael Ntahonkiriye Intwari | Facility Audit, Repo Hygiene & QA | Wrote `water_audit()`, set up `.gitignore`, wrote this README, created the manual testing checklist |

## Setup Instructions

### 1. Clone the repository

```bash
git clone <repo-url>
cd <repo-folder>
```

### 2. Start the hospital monitoring service

```bash
python3 hospital_system.py start
```

To stop it later:

```bash
python3 hospital_system.py stop
```

### 3. Initialize and secure the environment

Run the admin script first — this creates the required directories and
locks down permissions on `active_logs`:

```bash
chmod +x hospital_admin.sh
./hospital_admin.sh
```

This calls `initialize_system()` and `secure_data()` in order, then prints
`System Environment Secured` with the current date.

### 4. Run clinical analysis and facility audits

```bash
chmod +x hospital_analysis.sh
./hospital_analysis.sh
```

This scans the vitals logs for `CRITICAL` entries (writing results to
`reports/critical_alerts.txt`) and prints the average ICU water reserve
usage to the screen.

### 5. Archive logs

```bash
chmod +x hospital_archive.sh
./hospital_archive.sh
```

This moves the current logs from `active_logs/` into `archived_logs/` with
a timestamp in the filename, then recreates empty log files in
`active_logs/` so `hospital_system.py` can keep writing.

## Repository Structure

```
.
├── hospital_admin.sh          # Initializes directories, secures permissions, main entry point
├── hospital_analysis.sh       # process_vitals() and water_audit() — clinical + facility analysis
├── hospital_archive.sh        # Archives and timestamps log files
├── hospital_system.py         # Background service that generates the logs
├── .gitignore                 # Excludes generated logs/reports/pid files from Git
├── README.md                  # This file
├── active_logs/                # (generated at runtime, not committed)
├── archived_logs/              # (generated at runtime, not committed)
└── reports/                    # (generated at runtime, not committed)
```
