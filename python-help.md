# python-help

## For Python 2.7

### Installation needed packages (for Ubuntu 16.04)
```sh
apt-get install python-pip
pip2 install --upgrade pip
python -m pip list
python -m pip install setuptools wheel twine
```

### Generate python package
```sh
python setup.py sdist bdist_wheel
```

### Uploading the distribution archives
Go to directory where setup.py is located
```sh
twine upload dist/*
```

### Installing your newly uploaded package
```sh
pip install NEW_PKG
```

### Deinstallation
```sh
pip uninstall NEW_PKG
rm -rf NEW_PKG.egg-info build dist
```


# VIM with python extension
See https://realpython.com/vim-and-python-a-match-made-in-heaven/

## Install Plugin-Installer Vundle
```sh
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

## Edit ~/.vimrc
```sh
set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'vim-syntastic/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'tpope/vim-fugitive'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
nnoremap <space> za

let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

let python_highlight_all=1
syntax on

set nu
```

## Install plugins
```sh
:PluginInstall
```
