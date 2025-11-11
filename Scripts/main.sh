#!/bin/bash
# ====================================================
# Bash Menu Program with Logs Saved One Level Up
# ====================================================

# Get directory where script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Go one level up to main project directory
PROJECT_DIR="$(dirname "$SCRIPT_DIR")"

# Define log folder and file (one level up)
LOG_DIR="$PROJECT_DIR/Logs"
STATE_FILE="$LOG_DIR/last_responses.log"

# Ensure the logs directory exists
mkdir -p "$LOG_DIR"

# ----- Logging Functions -----

show_last_response() {
    if [[ -f "$STATE_FILE" ]]; then
        echo "--------------------------------------"
        echo "Last response:"
        tail -n 1 "$STATE_FILE"
        echo "--------------------------------------"
        echo ""
    else
        echo "--------------------------------------"
        echo "No last response found."
        echo "--------------------------------------"
        echo ""
    fi
}

save_response() {
    echo "$(date '+%d-%m-%Y %H:%M:%S') - $1" >> "$STATE_FILE"
}

# ----- Feature Functions -----

say_hello() {
    read -p "Enter your name: " name
    local msg="Hello, $name! Hope you're doing great."
    echo "$msg"
    save_response "$msg"
}

show_date() {
    local msg="Today's date and time is: $(date)"
    echo "$msg"
    save_response "$msg"
}

list_files() {
    echo "Files & Folder in the Level one directory:"
    cd .. && ls -lh
    local msg="Listed files in $(pwd)"
    save_response "$msg"
}

show_system_info() {
    local msg="System Info: $(uname -a)"
    echo "$msg"
    save_response "$msg"
}

add_numbers() {
    read -p "Enter first number: " num1
    read -p "Enter second number: " num2
    local sum=$((num1 + num2))
    local msg="The sum of $num1 and $num2 is: $sum"
    echo "$msg"
    save_response "$msg"
}

# ----- Main Menu Loop -----

while true; do
    clear
    echo "=============================="
    echo "     Bash Menu Program"
    echo "=============================="
    show_last_response
    echo "1) Say Hello"
    echo "2) Show Date & Time"
    echo "3) List Files"
    echo "4) Show System Info"
    echo "5) Add Two Numbers"
    echo "6) Exit Program"
    echo "=============================="

    read -p "Enter your choice [1-6]: " choice
    echo ""

    case $choice in
        1) say_hello ;;
        2) show_date ;;
        3) list_files ;;
        4) show_system_info ;;
        5) add_numbers ;;
        6)
            echo "Exiting program. Goodbye!"
            exit 0
            ;;
        *)
            echo "Invalid choice! Please enter a number between 1 and 6."
            ;;
    esac

    echo ""
    echo "--------------------------------------"
    echo "Task completed! Returning to main menu..."
    echo "--------------------------------------"
    sleep 2
done
