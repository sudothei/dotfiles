#!/bin/bash

# installing packages

yay -S                 \
connman-gtk            \
paperview-git          \
xwinwrap-git

sudo pacman -S         \
flameshot              \
dunst                  \
neovim                 \
python-pip             \
python                 \
gdb                    \
zsh                    \
gifsicle


# installing custom binaries

git clone https://github.com/sudothei/dwm.git
git clone https://github.com/sudothei/emojils.pl.git
git clone https://github.com/sudothei/ivrit_status.git
git clone https://github.com/sudothei/dmenu.git
git clone https://github.com/sudothei/batt_alert.git

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

cd batt_alert
sudo make clean install
cd ..

rm -rf dwm dmenu ivrit_status emojils.pl

sudo mv dmenu_run_history /usr/local/bin

## used for neovim plugins

npm install -g neovim
pip install neovim

## sets brave as default browser

xdg-mime default brave.desktop x-scheme-handler/http
xdg-mime default brave.desktop x-scheme-handler/htts
xdg-settings set default-web-browser brave.desktop      

# GDB GEF
wget -q -O- https://github.com/hugsy/gef/raw/master/scripts/gef.sh | sh

# zsh
chsh -s $(which zsh)

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

# To put files in ~
cp scene.gif ~/Pictures
sudo rm ~.profile
sudo chown -R paige .
rm -rf .git
rm README.md
cp -R -u . ~

# To install fonts
sudo mv -R u ~/fonts /usr/share

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
