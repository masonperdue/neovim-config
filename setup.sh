
# Setup Script for Neovim Config
# sudo apt install -y git && mkdir ~/.myconfig && cd ~/.myconfig && git clone https://github.com/masonperdue/neovim-config.git && cd neovim-config && chmod +x setup.sh && ./setup.sh

mkdir -p /home/masonp/.config/nvim/lua/
ln -sf /home/masonp/.myconfig/neovim-config/init.lua /home/masonp/.config/nvim/init.lua
ln -sf /home/masonp/.myconfig/neovim-config/lua/* /home/masonp/.config/nvim/lua/
