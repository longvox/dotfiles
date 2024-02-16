#!/usr/bin/env bash
source $(dirname "$(readlink -f "$BASH_SOURCE")")/../utils/log.sh
source $(dirname "$(readlink -f "$BASH_SOURCE")")/../utils/install.sh

info "[Python] Installing ..."
tryInstall install              \
    python3-dev                 \
    python3-pip                 \
    python3-setuptools
