#!/bin/bash

aptvim() {
    if hash apt-vim 2>/dev/null; then
        STATUS='1'
    else
        STATUS='2'
    fi
}

aptvim;

if [$STATUS=2]; then
    echo "apt-vim needs to be installed, trying to install apt-vim\n"
    curl -sL https://raw.githubusercontent.com/egalpin/apt-vim/master/install.sh | sh
else
    cp vimrc ~/.vimrc
    cp -r vim ~/.vim
    cp vimpkg ~/.vimpkg
    echo "Install Complete"
