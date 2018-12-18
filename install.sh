#!/bin/bash

bak_time=$(date "+%Y%m%d%H%M%S")

home=$(echo ~)
cur=$(pwd)

if [ -d "${home}/.vim/" ]; then
	mv ${home}/.vim ${home}/.vim_${bak_time}
fi

if [ -f "${home}/.vimrc" ]; then
	mv ${home}/.vimrc ${home}/.vimrc_${bak_time}
fi

ln -s ${cur}/.vim ${home}/.vim
ln -s ${cur}/.vimrc ${home}/.vimrc


