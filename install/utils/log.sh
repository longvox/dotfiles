#!/bin/bash
# Exit immediately if a command exits with a non-zero status.
set -eE 

RS="\033[0m"        # reset
HC="\033[1m"        # hicolor
UL="\033[4m"        # underline

ERROR="\033[31m"    # foreground red
INFO="\033[32m"     # foreground green
WARNING="\033[33m"  # foreground yellow
VERBOSE="\033[95m"  # foreground Light magenta
DEBUG="\033[96m"    # foreground Light cyan
SILLY="\033[94m"    # foreground Light blue

error() {
    echo -e "$HC$ERROR[ERROR]$RS $ERROR$1$RS"
}

info() {
    echo -e "$HC$INFO[INFO]$RS $INFO$1$RS"
}

warning() {
    echo -e "$HC$WARNING[WARNING]$RS $WARNING$1$RS"
}

verbose() {
    echo -e "$HC$VERBOSE[VERBOSE]$RS $VERBOSE$1$RS"
}

debug() {
    echo -e "$HC$DEBUG[DEBUG]$RS $DEBUG$1$RS"
}

silly() {
    echo -e "$HC$SILLY[SILLY]$RS $SILLY$1$RS"
}

log() {
    echo -e "$HC[LOG]$RS $1"
}

underline() {
    echo -e "$HC$UL$1$RS"
}
