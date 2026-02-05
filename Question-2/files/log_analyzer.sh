#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Error: Please provide a log file name."
    exit 1
fi

LOGFILE="$1"

if [ ! -f "$LOGFILE" ]; then
    echo "Error: File does not exist."
    exit 1
fi

if [ ! -r "$LOGFILE" ]; then
    echo "Error: File is not readable."
    exit 1
fi

TOTAL=$(wc -l < "$LOGFILE")
INFO_COUNT=$(grep -c " INFO " "$LOGFILE")
WARNING_COUNT=$(grep -c " WARNING " "$LOGFILE")
ERROR_COUNT=$(grep -c " ERROR " "$LOGFILE")

LAST_ERROR=$(grep " ERROR " "$LOGFILE" | tail -n 1)

echo "Total log entries: $TOTAL"
echo "INFO messages: $INFO_COUNT"
echo "WARNING messages: $WARNING_COUNT"
echo "ERROR messages: $ERROR_COUNT"

if [ -n "$LAST_ERROR" ]; then
    echo "Most recent ERROR message:"
    echo "$LAST_ERROR"
else
    echo "No ERROR messages found."
fi

DATE=$(date +%Y-%m-%d)
REPORT="logsummary_${DATE}.txt"

{
    echo "Log Summary Report - $DATE"
    echo "Total log entries: $TOTAL"
    echo "INFO messages: $INFO_COUNT"
    echo "WARNING messages: $WARNING_COUNT"
    echo "ERROR messages: $ERROR_COUNT"
    echo "Most recent ERROR message:"
    echo "${LAST_ERROR:-None}"
} > "$REPORT"
