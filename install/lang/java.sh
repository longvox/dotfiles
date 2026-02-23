#!/usr/bin/env bash
# shellcheck source=../lib/env.sh
source "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")/../lib/env.sh"

if [[ -d /usr/local/bin/jdk-11.0.22+7 ]]; then
    silly "[Java] Semeru JDK already installed."
else
    info "[Java] Installing Semeru JDK 11..."
    (cd "$HOME" && wget -q https://github.com/ibmruntimes/semeru11-binaries/releases/download/jdk-11.0.22%2B7_openj9-0.43.0/ibm-semeru-open-jdk_x64_linux_11.0.22_7_openj9-0.43.0.tar.gz \
        && sudo tar -xzf ibm-semeru-open-jdk_x64_linux_11.0.22_7_openj9-0.43.0.tar.gz -C /usr/local/bin \
        && sudo mv /usr/local/bin/jdk-11.0.22+7 /usr/local/bin/java \
        && rm -f ibm-semeru-open-jdk_x64_linux_11.0.22_7_openj9-0.43.0.tar.gz) || true
fi
tryInstall install default-jdk
