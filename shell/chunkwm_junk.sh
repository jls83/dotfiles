#!/bin/bash
if [ $MACHINE_TYPE = work ]
then
    CHUNKWM_PLIST_PATH="/Users/jls83/Library/LaunchAgents/com.koekeishiya.chunkwm.plist"
else
    # TODO: Remove this if/else check once I've build chunkwm on my personal machine
    CHUNKWM_PLIST_PATH="/Users/jls83/Library/LaunchAgents/homebrew.mxcl.chunkwm.plist"
fi
SKHD_PLIST_PATH="/Users/jls83/Library/LaunchAgents/homebrew.mxcl.skhd.plist"

if [ $1 = "restart" ]
then
    echo "Restarting skhd...";
    launchctl unload -w $SKHD_PLIST_PATH;
    launchctl load -w $SKHD_PLIST_PATH;
    echo "Restarting chunkwm...";
    launchctl unload -w $CHUNKWM_PLIST_PATH;
    launchctl load -w $CHUNKWM_PLIST_PATH;
elif [ $1 = "start" ]
then
    echo "Starting skhd...";
    launchctl load -w $SKHD_PLIST_PATH;
    echo "Starting chunkwm...";
    launchctl load -w $CHUNKWM_PLIST_PATH;
elif [ $1 = "stop" ]
then
    echo "Stopping skhd...";
    launchctl unload -w $SKHD_PLIST_PATH;
    echo "Stopping chunkwm...";
    launchctl unload -w $CHUNKWM_PLIST_PATH;
else
    echo "Unknown option \"$1\""
fi

