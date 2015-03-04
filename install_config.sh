#!/bin/sh
CURDIR=`pwd`

# create backups, for blind sighted users that doesnt even look what
# scripts does
if [ -f ~/.vimrc ]; then
	mv -f ~/.vimrc ~/.vimrc.bk
fi
if [ -f ~/.gvimrc ]; then
	mv -f ~/.gvimrc ~/.gvimrc.bk
fi
if [ -d ~/.vim ]; then
	mv -f ~/.vim ~/.vim.bk
fi

# create simlinks for the current dir, so our configuration is updated
# if its modified in the git repository
ln -sf ${CURDIR}/vimrc ~/.vimrc
ln -sf ${CURDIR}/gvimrc ~/.gvimrc
ln -sf ${CURDIR}/vim ~/.vim
