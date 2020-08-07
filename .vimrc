" vim:fdm=marker
" -{{{---- filetypes
"
filetype plugin on

syntax on
set nu

set nocompatible              " required
filetype off                  " required
set regexpengine=1

set tabstop=4
set softtabstop=4
set shiftwidth=4
" I will take care of the line breaking myself
"set textwidth=100
set expandtab
set autoindent
set fileformat=unix 

set backspace=indent,eol,start
set grepprg=grep\ -nH\ $*
set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=L
set guifont=Ubuntu\ Mono\ 12


set omnifunc=syntaxcomplete#Complete

"nnoremap <C-J> <C-W><C-J>
"nnoremap <C-K> <C-W><C-K>
"nnoremap <C-L> <C-W><C-L>
"nnoremap <C-H> <C-W><C-H>

" -----------------------------------------------------------------------------------------------}}}
" -{{{---- C++ projects ----------------------------------------------------------------------------
" --------------------------------------------------------------------------------------------------

set exrc
set secure
let g:completor_clang_binary = '/usr/bin/clang'
let g:clang_library_path = '/usr/local/lib/clang/8.0.0/lib/linux/'

" -----------------------------------------------------------------------------------------------}}}
" -{{{---- Plugin Installation ---------------------------------------------------------------------
" --------------------------------------------------------------------------------------------------

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)

Plugin 'vim-scripts/indentpython.vim'
"Plugin 'Valloric/YouCompleteMe'
Plugin 'maralla/completor.vim'
Plugin 'jnurmine/Zenburn'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'

" Syntax checkers
"Plugin 'scrooloose/syntastic'
Plugin 'w0rp/ale'

Plugin 'nvie/vim-flake8'
"Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'vim-airline/vim-airline'
"Plugin 'kien/ctrlp.vim'
Plugin 'tmhedberg/SimpylFold'
Plugin 'tpope/vim-fugitive'

" Colorschemes
"Plugin 'rafi/awesome-vim-colorschemes'
Plugin 'yuttie/inkstained-vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'nightsense/snow'
Plugin 'nightsense/rusticated'
Plugin 'BrainDeath0/Hypsteria'
Plugin 'andreypopp/vim-colors-plain'
Plugin 'benburrill/potato-colors'
Plugin 'szorfein/fantasy.vim'
Plugin 'jaredgorski/SpaceCamp'
Plugin 'flrnprz/plastic.vim'


" rust
Plugin 'rust-lang/rust.vim'
Plugin 'racer-rust/vim-racer'
Plugin 'rust-lang-nursery/rustfmt'

" c++
"Plugin 'octol/vim-cpp-enhanced-highlight'
"Plugin 'Rip-Rip/clang_complete'
"Plugin 'LucHermitte/lh-vim-lib'
"Plugin 'LucHermitte/lh-style'
"Plugin 'LucHermitte/lh-tags'
"Plugin 'LucHermitte/lh-dev'
"Plugin 'awegsche/lh-brackets'
"Plugin 'LucHermitte/searchInRuntime'
"Plugin 'LucHermitte/mu-template'
"Plugin 'tomtom/stakeholders_vim'
"Plugin 'LucHermitte/alternate-lite'
"Plugin 'LucHermitte/lh-cpp'
"Plugin 'vim-scripts/genutils'
"Plugin 'albfan/vim-breakpts'
"Plugin 'LucHermitte/local_vimrc'
"
Plugin 'Shougo/vimproc.vim'
Plugin 'idanarye/vim-vebugger'
Plugin 'ludovicchabant/vim-gutentags'
Plugin 'abudden/taghighlight-automirror'
Plugin 'autozimu/LanguageClient-neovim'

Plugin 'kshenoy/vim-signature'



" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


" -----------------------------------------------------------------------------------------------}}}
" -{{{---- Python ----------------------------------------------------------------------------------
" --------------------------------------------------------------------------------------------------

"python with virtualenv support
python << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF

let python_highlight_all=1


" -----------------------------------------------------------------------------------------------}}}
" -{{{---- Appearance ------------------------------------------------------------------------------
" --------------------------------------------------------------------------------------------------

set background=dark
colorscheme snow

set colorcolumn=101
highlight ColorColumn ctermbg=236


set listchars=eol:$,tab:>-,trail:~,space:.

set nowrap
set hlsearch

:nnoremap <F8> :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR>

"au VimEnter * NERDTree 
au VimEnter * wincmd l 

syntax on

set foldlevel=99
nnoremap <space> za
let g:SimpylFold_docstring_preview=1

let g:cym_rust_src_path = '/home/awegsche/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src'

let termwinsize = 20

nnoremap <C-F8> :botright split <CR> :resize 20 <CR> :terminal ++curwin <CR>

" -----------------------------------------------------------------------------------------------}}}
" -{{{---- C++ -------------------------------------------------------------------------------------
" --------------------------------------------------------------------------------------------------
"
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_experimental_template_highlight = 1
let g:cpp_concepts_highlight = 1
let g:vebugger_leader="\\"

au BufRead,BufNewFile *
            \ let b:marker_open='<+' |
            \ let b:marker_close='+>'


" -----------------------------------------------------------------------------------------------}}}
" -{{{---- FORTRAN ---------------------------------------------------------------------------------
" --------------------------------------------------------------------------------------------------
"
let fortran_fixed_source=1

" -----------------------------------------------------------------------------------------------}}}
" -{{{---- LaTeX -----------------------------------------------------------------------------------
" --------------------------------------------------------------------------------------------------

let g:tex_flavor='latex'
let g:Tex_GotoError=0

let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

let g:Tex_IgnoredWarnings=
            \"Underfull\n".
            \"Overfull\n".
            \"A float is stuck\n"
            \"specifier changed to\n".
            \"You have requested\n".
            \"Missing number, treated as zero.\n".
            \"There were undefined references\n".
            \"Token not allowed\n"
            \"Citation %.%# undefined\n".
let g:Tex_IgnoreLevel=6
let g:Tex_ViewRule_pdf = 'evince'
let g:Tex_DefaultTargetFormat="pdf"
let g:Tex_MultipleCompileFormats="pdf"
let g:Tex_CompileRule_pdf="pdflatex --synctex=1 -interaction=nonstopmode $*"
"
"
function SetXeTex()
    let g:Tex_CompileRule_pdf = 'xelatex  --synctex=1 -shell-escape -src-specials -interaction=nonstopmode $*'
endfunction
function SetWebTex()
    let g:Tex_CompileRule_pdf = 'xelatex  --synctex=1 -shell-escape -src-specials -interaction=nonstopmode $*'
endfunction
map <Leader>lx :<C-U>call SetXeTex()<CR>
map <Leader>lw :<C-U>call SetWebTex()<CR>


" -----------------------------------------------------------------------------------------------}}}
