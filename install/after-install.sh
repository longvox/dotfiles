rm -rf autojump/
rm -rf *.deb.*
rm -rf *.deb
rm -rf *.appimage
rm -rf *.appimage.*

sudo du -sh /var/cache/apt/archives
sudo apt-get autoremove
sudo du -sh /var/cache/apt
sudo apt-get clean
sudo apt-get autoclean
