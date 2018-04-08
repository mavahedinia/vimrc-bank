#!/bin/bash

mkdir -p ~/.vim/colors

cp deus.vim ~/.vim/colors/
cp ./vimrc ~/.vimrc

git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree
git clone https://github.com/bling/vim-airline ~/.vim/bundle/vim-airline
git clone https://github.com/vim-airline/vim-airline-themes ~/.vim/bundle/vim-airline-themes
git clone https://github.com/yggdroot/indentline ~/.vim/bundle/indentline
git clone https://github.com/roxma/vim-paste-easy ~/.vim/bundle/vim-paste-easy
git clone https://github.com/nathanaelkane/vim-indent-guides ~/.vim/bundle/vim-indent-guides
git clone https://github.com/davidhalter/jedi-vim ~/.vim/bundle/jedi-vim

echo "Install Complete"
