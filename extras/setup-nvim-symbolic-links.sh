#!/usr/bin/bash

# Install nvim appimage for root and other users
# This should be run without any pre-existing ln's in these locations
sudo ln -s /home/ruser/bin/nvim.appimage /usr/bin/vi
sudo ln -s /home/ruser/bin/nvim.appimage /usr/bin/nvim
sudo ln -s /home/ruser/.config/nvim /root/.config
