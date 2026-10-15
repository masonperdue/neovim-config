
# Setup Script for Neovim Config
# sudo apt install -y git && cd && git clone git@github.com:masonperdue/neovim-config.git && cd neovim-config && ./setup.sh

sudo apt remove --purge -y vim-common vim-tiny
sudo apt autoremove --purge -y
sudo apt install -y neovim
mkdir -p /home/$USER/.config/nvim/lua/
ln -sf /home/$USER/neovim-config/nvim/init.lua /home/$USER/.config/nvim/init.lua
ln -sf /home/$USER/neovim-config/nvim/lua/* /home/$USER/.config/nvim/lua/
