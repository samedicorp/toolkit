#!/bin/sh


killall "love"
sleep 1
/Applications/love.app/Contents/MacOS/love "$1"
# open -a love "$1"