#!/bin/bash

bak_time=$(date "+%Y%m%d%H%M%S")

home=$(echo ~)
cur=$(pwd)

if [ -L "${home}/.vim" ]; then
	rm ${home}/.vim
fi
if [ -d "${home}/.vim/" ]; then
	mv ${home}/.vim ${home}/.vim_${bak_time}
fi
ln -s ${cur}/my.vim ${home}/.vim

if [ -L "${home}/bin2" ]; then
	rm ${home}/bin2
fi
if [ -d "${home}/bin2/" ]; then
	mv ${home}/bin2 ${home}/bin2_${bak_time}
fi
ln -s ${cur}/bin ${home}/bin2

if [ -L "${home}/.vimrc" ]; then
	rm ${home}/.vimrc
fi
if [ -f "${home}/.vimrc" ]; then
	mv ${home}/.vimrc ${home}/.vimrc_${bak_time}
fi
ln -s ${cur}/my.vimrc ${home}/.vimrc

if [ -L "${home}/.bash_cfg" ]; then
	rm ${home}/.bash_cfg
fi
ln -s ${cur}/my.bash_cfg ${home}/.bash_cfg

if [ -L "${home}/.tmux.conf" ]; then
	rm ${home}/.tmux.conf
fi
if [ -f "${home}/.tmux.conf" ]; then
	mv ${home}/.tmux.conf${home}/.tmux.conf_${bak_time}
fi
ln -s ${cur}/my.tmux.conf ${home}/.tmux.conf

#  For neovim
mkdir -p ~/.config
if [ -L "${home}/.config/nvim" ]; then
	rm ${home}/.config/nvim
fi
ln -s ${cur}/my.vim ~/.config/nvim
if [ -L "${home}/.config/nvim/init.vim" ]; then
	rm ${home}/.config/nvim/init.vim
fi
ln -s ${cur}/my.vimrc ~/.config/nvim/init.vim

# install fzf
if [ -d "${home}/.fzf/" ]; then
	mv ${home}/.fzf ${home}/.fzf_${bak_time}
fi

if [ -L "${home}/.fzf" ]; then
	rm ${home}/.fzf
fi
ln -s ${cur}/my.tool/fzf ${home}/.fzf
~/.fzf/install --all


