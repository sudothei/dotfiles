#!/bin/bash

yay -S                 \
connman-gtk            

sudo pacman -S         \
flameshot              \
dunst                  \
neovim                 \
python-pip             \
iwd

git clone git@github.com:sudothei/dwm.git
git clone git@github.com:sudothei/emojils.pl.git
git clone git@github.com:sudothei/ivrit_status.git
git clone git@github.com:sudothei/dmenu.git

cd dwm
sudo make clean install
cd ..

cd dmenu
sudo make clean install
cd ..

cd ivrit_status
sudo make clean install
cd ..

cd emojils.pl
chmod +x install.sh
sudo ./install.sh
cd ..

rm -rf dwm dmenu ivrit_status emojils.pl

sudo cp dmenu_run_history /usr/local/bin

## used for neovim plugins

npm install -g neovim
pip install neovim

## sets brave as default browser

xdg-mime default brave.desktop x-scheme-handler/http
xdg-mime default brave.desktop x-scheme-handler/htts
xdg-settings set default-web-browser brave.desktop      

## configures iwd instead of wpa_supplicant or NetworkMangler

sudo cp iwd.service connman_iwd.service /etc/systemd/system/
sudo systemctl disable NetworkManager
sudo systemctl disable wpa_supplicant
sudo systemctl stop NetworkManager
sudo systemctl stop wpa_supplicant
sudo systemctl enable iwd.service
sudo systemctl start iwd.service
sudo systemctl enable connman
sudo systemctl start connman
sudo systemctl disable lightdm
sudo systemctl enable nodm

# GDB GEF
wget -q -O- https://github.com/hugsy/gef/raw/master/scripts/gef.sh | sh

## TODO enable and install blackarch

sudo pacman -Sy overwrite \* blackarch

## TODO
## configure /etc/nodm.conf

# TO-DO
# Make grub style happen automatically
#- New environment:
  #- Buildscript for setup
  #- Manjaro
  #- iwd > networkmangler
  #- connman
  #- grub
  #- zsh
  #- rebind CAPS
  #- config file's pci devices rewritten by script
  #- autoinstall browser extensions

# Prompt to install sudo first
read -p "Please install sudo and setup sudoers first"


# To ignore failures & report on them still
set +e

# add blackarch repo
sudo pacman -S curl
curl -O https://blackarch.org/strap.sh
chmod +x strap.sh
sudo ./strap.sh
rm strap.sh

 # To move stuff around
 cd ~
 sudo rm .profile
 sudo chown -R paige dotfiles
 cd dotfiles
 rm .git
 rm README.md
 cd ~
 cp -R -u dotfiles ~


 # To install vim plugins

git clone https://github.com/preservim/nerdcommenter.git ~/.config/nvim/pack/plugins/start/nerdcommenter
git clone https://github.com/Valloric/MatchTagAlways.git ~/.config/nvim/pack/plugins/start/matchtagalways
git clone https://github.com/Yggdroot/indentLine.git ~/.config/nvim/pack/plugins/start/indentline
git clone https://github.com/jiangmiao/auto-pairs.git ~/.config/nvim/pack/plugins/start/autopairs
git clone https://github.com/tpope/vim-surround.git ~/.config/nvim/pack/plugins/start/vim-surround
git clone https://github.com/lervag/vimtex.git  ~/.config/nvim/pack/plugins/start/vimtex
git clone https://github.com/suan/vim-instant-markdown.git ~/.config/nvim/pack/plugins/start/vim-instant-markdown
git clone https://github.com/skammer/vim-css-color.git ~/.config/nvim/pack/plugins/start/vim-css-color
git clone https://github.com/yegappan/greplace ~/.config/nvim/pack/plugins/start/graplace
cd ~/.config/nvim/pack/plugins/start
curl --fail -L https://github.com/neoclide/coc.nvim/archive/release.tar.gz|tar xzfv -
cd ~
nvim -u NONE -c "helptags ~/.config/nvim/pack/plugins/start/nerdcommenter/doc" -c q
nvim -u NONE -c "helptags ~/.config/nvim/pack/plugins/start/matchtagalways/doc" -c q
nvim -u NONE -c "helptags ~/.config/nvim/pack/plugins/start/indentline/doc" -c q
nvim -u NONE -c "helptags ~/.config/nvim/pack/plugins/start/autopairs/doc" -c q
nvim -u NONE -c "helptags ~/.config/nvim/pack/plugins/start/vim-surround/doc" -c q
nvim -u NONE -c "helptags ~/.config/nvim/pack/plugins/start/coc.nvim-release/doc" -c q
nvim -u NONE -c "helptags ~/.config/nvim/pack/plugins/start/vimtex/doc" -c q
nvim -u NONE -c "helptags ~/.config/nvim/pack/plugins/start/vim-instant-markdown/doc" -c q
nvim -u NONE -c "helptags ~/.config/nvim/pack/plugins/start/vim-css-color/doc" -c q
nvim -u NONE -c "helptags ~/.config/nvim/pack/plugins/start/greplace/doc" -c q
sudo npm -g install instant-markdown-d 
nvim -c 'CocInstall -sync coc-json coc-html coc-python coc-eslint coc-snippets coc-phpls coc-texlab coc-markdownlint coc-css coc-prettier coc-tsserver|q coc-java'
