#!/usr/bin/env bash
source $(dirname "$(readlink -f "$BASH_SOURCE")")/../utils/log.sh
source $(dirname "$(readlink -f "$BASH_SOURCE")")/../utils/install.sh
PATH_CURRENT=$(dirname "$(readlink -f "$BASH_SOURCE")")

info "[Julia] Installing ..."
cd ~
curl -fsSL https://install.julialang.org | sh
cd PATH_CURRENT
