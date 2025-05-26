" ecoding setting
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,cp932

" editor setting
set number
set showcmd
set splitbelow
set splitright
set noequalalways
set wildmenu
set smartindent

" temp file setting
set noundofile
set noswapfile

" search
set ignorecase
set smartcase

"cursor setting
set ruler
set cursorline

"tab setting
set expandtab
set tabstop=2
set shiftwidth=2


"dein
if &compatible
  set nocompatible " Be iMproved
endif

"add the dein installation DIR into tuntimepath
set rtp+=c:/users/nakagawa/HOME/.XDGconfig/nvim/dein/repos/github.com/Shougo/dein.vim

let s:dein_dir = expand('c:/users/nakagawa/HOME/.XDGconfig/nvim/dein')

"rtpにdeinがない場合 gitからダウンロード
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  call dein#load_toml('c:/users/nakagawa/HOME/.XDGconfig/nvim/dein/toml/dein.toml', {'lazy': 0})
  call dein#load_toml('c:/users/nakagawa/HOME/.XDGconfig/nvim/dein/toml/dein_lazy.toml', {'lazy': 1})
  
  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif

filetype plugin indent on
syntax on
