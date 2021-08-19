#!/bin/bash

if [ $1 = "restart" ]
then
    echo "Restarting skhd...";
    brew services restart skhd
    echo "Restarting yabai...";
    brew services restart yabai
elif [ $1 = "start" ]
then
    echo "Starting skhd...";
    brew services start skhd
    echo "Starting yabai...";
    brew services start yabai
elif [ $1 = "stop" ]
then
    echo "Stopping skhd...";
    brew services stop skhd
    echo "Stopping yabai...";
    brew services stop yabai
else
    echo "Unknown option \"$1\""
fi

