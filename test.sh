#!/bin/sh

# /Applications/love.app/Contents/MacOS/love "$1"

killall "love"
sleep 1
open -a love "$1"