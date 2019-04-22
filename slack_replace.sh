#!/bin/sh

# Set up directory variables and file names
SLACK_STATIC_DIR="/Applications/Slack.app/Contents/Resources/app.asar.unpacked/src/static"
HOME_DIR="/Users/jls83"

CUSTOM_FILE_NAME="$HOME_DIR/ssb-interop.custom.js"
CURRENT_FILE_NAME="$SLACK_STATIC_DIR/ssb-interop.js"

# Set up backup file name
CURRENT_DATE=`date +%F`
BAK_FILE="$HOME_DIR/ssb-interop.js.bak.$CURRENT_DATE"

# Backup the current "good" file, copy the custom file over
cp $CURRENT_FILE_NAME $BAK_FILE
cp $CUSTOM_FILE_NAME $CURRENT_FILE_NAME
