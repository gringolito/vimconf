#!/bin/sh
CURDIR=`pwd`

# create backups, for blind sighted users that doesnt even look what
# scripts does
if [ -f ~/.vimrc ] && [ ! -L ~/.vimrc ]; then
	mv -f ~/.vimrc ~/.vimrc.bk
fi
if [ -f ~/.gvimrc ] && [ ! -L ~/.gvimrc ]; then
	mv -f ~/.gvimrc ~/.gvimrc.bk
fi
if [ -d ~/.vim ] && [ ! -L ~/.vim ]; then
	mv -f ~/.vim ~/.vim.bk
fi
if [ -d ~/.config/nvim ] && [ ! -L ~/.config/nvim ]; then
	mv -f ~/.config/nvim ~/.config/nvim.bk
fi

# create simlinks for the current dir, so our configuration is updated
# if its modified in the git repository
ln -sf ${CURDIR}/vim/init.rc ~/.vimrc
ln -sf ${CURDIR}/gvimrc ~/.gvimrc
ln -sf ${CURDIR}/vim ~/.vim
ln -sf ${CURDIR}/vim ~/.config/nvim
