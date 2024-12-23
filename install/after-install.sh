#!/usr/bin/env bash
sudo rm -rf ~/.dotfiles/.temp-install
sudo du -sh /var/cache/apt/archives
sudo du -sh /var/cache/apt
sudo apt-get clean
sudo apt-get autoremove
sudo apt-get autoclean
