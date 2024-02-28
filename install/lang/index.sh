#!/usr/bin/env bash
PATH_CURRENT=$(dirname "$(readlink -f "$BASH_SOURCE")")
source $PATH_CURRENT/../utils/log.sh

info "[Language Programing] Installing...."
# source $PATH_CURRENT/../lang/javascript.sh
# source $PATH_CURRENT/../lang/python.sh
# source $PATH_CURRENT/../lang/ruby.sh
# source $PATH_CURRENT/../lang/go.sh
# source $PATH_CURRENT/../lang/php.sh
# source $PATH_CURRENT/../lang/rust.sh
# source $PATH_CURRENT/../lang/lua.sh
# source $PATH_CURRENT/../lang/julia.sh
source $PATH_CURRENT/../lang/java.sh

cd $PATH_CURRENT/../../

