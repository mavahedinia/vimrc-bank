" The magical turn-Vim-into-a-Python-IDE vim resource file!
"
" Mostly taken from https://dev.launchpad.net/UltimateVimPythonSetup
" Other bits culled from various sources, Canonical guys, or made up by me.
"
" Danial Behzadi 2013-08-05

" Wrapping and tabs.
set tw=78 ts=4 sw=4 sta et sts=4 ai

" More syntax highlighting.
let python_highlight_all = 1

" Smart indenting
set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class

" Auto delete trailing white spaces when saving files
func! DeleteTrailingWS()
	exe "normal mz"
	%s/\s\+$//ge
	exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()

" Folding code
set foldmethod=indent
set foldlevel=1
nnoremap <space> za

"" Auto completion via ctrl-space (instead of the nasty ctrl-x ctrl-o)
"set omnifunc=pythoncomplete#Complete
"inoremap <Nul> <C-x><C-o>

" Wrap at 72 chars for comments.
set formatoptions=cq textwidth=72 foldignore= wildignore+=*.py[co]

" Highlight end of line whitespace.
highlight WhitespaceEOL ctermbg=red guibg=red
match WhitespaceEOL /\s\+$/

" The next two highlight matches break the previous one, I don't know why.
" Show long lines.
"highlight LongLine guibg=red ctermbg=red
"match LongLine /\%>79v.\+/
" Highlight bzr merge markers.
"highlight MergeMarker guibg=red ctermbg=red
"match MergeMarker /^[<=>\|]\{7\}\( [A-Z]\+\)?$/

" `gf` jumps to the filename under the cursor.  Point at an import statement
" and jump to it!
python3 << EOF
import os
import sys
import vim
for p in sys.path:
    if os.path.isdir(p):
        vim.command(r"set path+=%s" % (p.replace(" ", r"\ ")))
EOF

" Generate tags with: ctags -R -f ~/.vim/tags/python24.ctags /usr/lib/python2.4/
" ctrl-[ to go to the tag under the cursor, ctrl-T to go back.
set tags+=$HOME/.vim/tags/python24.ctags

" Use :make to see syntax errors. (:cn and :cp to move around, :dist to see
" all errors)
set makeprg=python\ -c\ \"import\ py_compile,sys;\ sys.stderr=sys.stdout;\ py_compile.compile(r'%')\"
set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m

" Execute code
" Use VISUAL to select a range and then hit ctrl-h to execute it.
python3 << EOL
import vim
def EvaluateCurrentRange():
    eval(compile('\n'.join(vim.current.range),'','exec'),globals())
EOL
"map <C-h> :py EvaluateCurrentRange()

" Use <F5> to execute code and <S-F5> to execute it with value.
python3 << EOL
import vim
def EvaluateCurrentBuffer():
	eval(compile('\n'.join(vim.current.buffer),'','exec'),globals())
EOL
map <F5> :python3 EvaluateCurrentBuffer()<CR>
map <S-F5> :python3 EvaluateCurrentRange()

" Use <F9> to save and execute it in terminal.
map <F9> :w<CR>:!python3 %<CR>

" Use <S-F9> to save and execute it in terminal.
map <S-F9> :w<CR>:!python3 % 

" Use F7/Shift-F7 to add/remove a breakpoint (pdb.set_trace)
" Totally cool.
python3 << EOF
def SetBreakpoint():
    import re
    nLine = int( vim.eval( 'line(".")'))

    strLine = vim.current.line
    strWhite = re.search( '^(\s*)', strLine).group(1)

    vim.current.buffer.append(
       "%(space)spdb.set_trace() %(mark)s Breakpoint %(mark)s" %
         {'space':strWhite, 'mark': '#' * 30}, nLine - 1)

    for strLine in vim.current.buffer:
        if strLine == "import pdb":
            break
    else:
        vim.current.buffer.append( 'import pdb', 0)
        vim.command( 'normal j1')

vim.command( 'map <f7> :python3 SetBreakpoint()<cr>')

def RemoveBreakpoints():
    import re

    nCurrentLine = int( vim.eval( 'line(".")'))

    nLines = []
    nLine = 1
    for strLine in vim.current.buffer:
        if strLine == "import pdb" or strLine.lstrip()[:15] == "pdb.set_trace()":
            nLines.append( nLine)
        nLine += 1

    nLines.reverse()

    for nLine in nLines:
        vim.command( "normal %dG" % nLine)
        vim.command( "normal dd")
        if nLine < nCurrentLine:
            nCurrentLine -= 1

    vim.command( "normal %dG" % nCurrentLine)

vim.command( "map <s-f7> :python3 RemoveBreakpoints()<cr>")
EOF
"vim:syntax=vim

" Use this plugin https://github.com/scrooloose/syntastic
