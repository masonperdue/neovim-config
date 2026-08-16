
# Setup Script for Neovim Config
# sudo apt install -y git && mkdir ~/.myconfig && cd ~/.myconfig && git clone https://github.com/masonperdue/neovim-config.git && cd neovim-config && chmod +x setup.sh && ./setup.sh

sudo apt remove --purge -y vim-common vim-tiny
sudo apt autoremove --purge -y
sudo apt install -y neovim
mkdir -p /home/$USER/.config/nvim/lua/
ln -sf /home/$USER/.myconfig/neovim-config/init.lua /home/$USER/.config/nvim/init.lua
ln -sf /home/$USER/.myconfig/neovim-config/lua/* /home/$USER/.config/nvim/lua/
