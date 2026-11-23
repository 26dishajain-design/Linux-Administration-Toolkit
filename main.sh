#!/usr/bin/env bash
# Linux-Based Administration Toolkit
# Beginner-friendly menu-driven Linux administration project.

set -u

PROJECT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
LOG_DIR="$PROJECT_DIR/logs"
LOG_FILE="$LOG_DIR/activity.log"
BACKUP_DIR="$PROJECT_DIR/backups"

mkdir -p "$LOG_DIR" "$BACKUP_DIR"

# Load reusable functions.
source "$PROJECT_DIR/scripts/toolkit_functions.sh"

log_action "Toolkit started"

while true; do
    clear
    echo "=============================================="
    echo "       LINUX ADMINISTRATION TOOLKIT"
    echo "=============================================="
    echo "1. View system information"
    echo "2. View CPU and running processes"
    echo "3. View memory usage"
    echo "4. View disk usage"
    echo "5. View network information"
    echo "6. View current user information"
    echo "7. Create a folder backup"
    echo "8. View toolkit activity log"
    echo "9. Exit"
    echo "=============================================="
    read -r -p "Enter your choice (1-9): " choice

    case "$choice" in
        1) show_system_info; pause ;;
        2) show_cpu_processes; pause ;;
        3) show_memory_usage; pause ;;
        4) show_disk_usage; pause ;;
        5) show_network_info; pause ;;
        6) show_user_info; pause ;;
        7) create_backup; pause ;;
        8) show_activity_log; pause ;;
        9)
            log_action "Toolkit closed"
            echo "Thank you for using Linux Administration Toolkit."
            exit 0
            ;;
        *)
            echo "Invalid choice. Please enter a number from 1 to 9."
            pause
            ;;
    esac
done
