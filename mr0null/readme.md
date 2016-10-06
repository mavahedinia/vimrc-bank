### What it does?
This vimrc sets guifont size height to 14, uses cindend for indenting your code, shows line numbers and do syntax highlighing. Also enables mouse and sets tab space to 4.

It uses molokai colorscheme and also enables using system clipboard on mac os x (to enable it on linux, just change the line containing `set clipboard=unnamed` to `set clipboard=unnamedplus`. to compile and run your program you have 2 options:
- use vim command mak
- use single compile plugin (which runs your code with defined compiler in this file by using `SHIFT+R`

For competitive programmers who use templates for their codes, you can use function Cp() to read from file newtemplate.cpp and then copy it to current file! also this can be done by key `F2` in a more pleasant way! the `F2` key inserts template to current file, goes to the line which you want to start coding from (like 20 in this file), and then goes to insert mode.

to comment code in c++, you can go to the line, and press `F3` to comment, and `F4` to un-comment! and to save file, you can use `SHIFT+S`.

all the hotkeys defined just work in normal mode! for further information just read the `vimrc` file!