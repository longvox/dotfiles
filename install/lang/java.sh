#!/usr/bin/env bash
source $(dirname "$(readlink -f "$BASH_SOURCE")")/../utils/log.sh
source $(dirname "$(readlink -f "$BASH_SOURCE")")/../utils/install.sh
PATH_CURRENT=$(dirname "$(readlink -f "$BASH_SOURCE")")


cd ~
if [ ! -d /usr/local/bin/jdk-11.0.22+7 ];
then
    info "[Java] Installing ..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    wget https://github.com/ibmruntimes/semeru11-binaries/releases/download/jdk-11.0.22%2B7_openj9-0.43.0/ibm-semeru-open-jdk_x64_linux_11.0.22_7_openj9-0.43.0.tar.gz
    sudo tar -xzvf ibm-semeru-open-jdk_x64_linux_11.0.22_7_openj9-0.43.0.tar.gz -C /usr/local/bin
    sudo mv /usr/local/bin/jdk-11.0.22+7 /usr/local/bin/java
    rm -rf ~/ibm-semeru-open-jdk_x64_linux_11.0.22_7_openj9-0.43.0.*
else
   silly "[Java] Installed."
fi

tryInstall install default-jdk
source ~/.zshrc
cd PATH_CURRENT
