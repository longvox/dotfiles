#!/usr/bin/env bash
# Logging helpers. Do not use set -e here; let the caller decide.
[[ -n "${_DOTFILES_LIB_LOG_LOADED:-}" ]] && return
_DOTFILES_LIB_LOG_LOADED=1

readonly RS="\033[0m"        # reset
readonly HC="\033[1m"        # hicolor
readonly UL="\033[4m"        # underline
readonly ERROR="\033[31m"    # foreground red
readonly INFO="\033[32m"     # foreground green
readonly WARNING="\033[33m"  # foreground yellow
readonly VERBOSE="\033[95m"   # foreground Light magenta
readonly DEBUG="\033[96m"    # foreground Light cyan
readonly SILLY="\033[94m"    # foreground Light blue

error() { echo -e "${HC}${ERROR}[ERROR]${RS} ${ERROR}$*${RS}"; }
info() { echo -e "${HC}${INFO}[INFO]${RS} ${INFO}$*${RS}"; }
warning() { echo -e "${HC}${WARNING}[WARNING]${RS} ${WARNING}$*${RS}"; }
verbose() { echo -e "${HC}${VERBOSE}[VERBOSE]${RS} ${VERBOSE}$*${RS}"; }
debug() { echo -e "${HC}${DEBUG}[DEBUG]${RS} ${DEBUG}$*${RS}"; }
silly() { echo -e "${HC}${SILLY}[SILLY]${RS} ${SILLY}$*${RS}"; }
log() { echo -e "${HC}[LOG]${RS} $*"; }
underline() { echo -e "${HC}${UL}$*${RS}"; }
