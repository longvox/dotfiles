#!/usr/bin/env bash
# shellcheck source=../lib/env.sh
source "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")/../lib/env.sh"

info "[Ruby] Installing ..."
tryInstall install ruby ruby-dev

if command_exists ruby; then
    ruby_dev_pkg="ruby$(ruby -e 'puts RUBY_VERSION[/\d+\.\d+/]')-dev"
    tryInstall install "$ruby_dev_pkg"
    tryInstall installGem colorls
fi
