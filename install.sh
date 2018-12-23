#!/bin/bash

bak_time=$(date "+%Y%m%d%H%M%S")

home=$(echo ~)
cur=$(pwd)

if [ -L "${home}/.vim" ]; then
	rm ${home}/.vim
fi

if [ -L "${home}/bin2" ]; then
	rm ${home}/bin2
fi

if [ -L "${home}/.vimrc" ]; then
	rm ${home}/.vimrc
fi

if [ -L "${home}/.bash_cfg" ]; then
	rm ${home}/.bash_cfg
fi

if [ -d "${home}/.vim/" ]; then
	mv ${home}/.vim ${home}/.vim_${bak_time}
fi

if [ -d "${home}/bin2/" ]; then
	mv ${home}/bin2 ${home}/bin2_${bak_time}
fi

if [ -f "${home}/.vimrc" ]; then
	mv ${home}/.vimrc ${home}/.vimrc_${bak_time}
fi


# Use soft link is better, because this will be changed in frequency.
ln -s ${cur}/my.vim ${home}/.vim
ln -s ${cur}/bin ${home}/bin2
ln -s ${cur}/my.vimrc ${home}/.vimrc
ln -s ${cur}/my.bash_cfg ${home}/.bash_cfg


