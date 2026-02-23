#!/usr/bin/env bash
# shellcheck source=../lib/env.sh
source "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")/../lib/env.sh"

info "[Python] Installing ..."
tryInstall install python3-venv python3-dev python3-pip python3-setuptools
