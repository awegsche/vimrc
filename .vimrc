" vim:fdm=marker
" -{{{---- filetypes
"
"
set hidden

filetype plugin on

syntax on
set nu rnu

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

set guifont=Fira\ Code:h12
if has('linux')
    set guifont=Fira\ Code:h2
endif
if has('win32')
    set guifont=Fira\ Code:h10
endif


set omnifunc=syntaxcomplete#Complete

"nnoremap <C-J> <C-W><C-J>
"nnoremap <C-K> <C-W><C-K>
"nnoremap <C-L> <C-W><C-L>
"nnoremap <C-H> <C-W><C-H>
"
"
" -----------------------------------------------------------------------------------------------}}}
" -{{{---- windows ---------------------------------------------------------------------------------
" --------------------------------------------------------------------------------------------------
" if has('win32')
"     set shell=powershell.exe
" endif

" -----------------------------------------------------------------------------------------------}}}
" -{{{---- C++ projects ----------------------------------------------------------------------------
" --------------------------------------------------------------------------------------------------

set exrc
set secure
"let g:completor_clang_binary = '/usr/bin/clang'
"let g:clang_library_path = '/usr/local/lib/clang/8.0.0/lib/linux/'

" -----------------------------------------------------------------------------------------------}}}
" -{{{---- Plugin Installation ---------------------------------------------------------------------
" --------------------------------------------------------------------------------------------------

" -------- Setup Vundle ----------------------------------------------------------------------------
" set the runtime path to include Vundle and initialize
if has('win32')
  set rtp+=$HOME/.config/bundle/Vundle.vim/
  call vundle#begin('$HOME/.config/bundle/')
else 
  set rtp+=~/.config/nvim/bundle/Vundle.vim
  call vundle#begin()
endif

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" -------- Vim itself ------------------------------------------------------------------------------
Plugin 'ciaranm/securemodelines'
Plugin 'itchyny/lightline.vim'
Plugin 'itchyny/vim-gitbranch'
Plugin 'spywhere/lightline-lsp'
Plugin 'machakann/vim-highlightedyank'
Plugin 'michaelb/sniprun', {'do': 'bash install.sh'}


" -------- Fuzzy finder ----------------------------------------------------------------------------
"  note: vim-rooter occasionally messes up project root dirs
"Plugin 'airblade/vim-rooter'
"
Plugin 'junegunn/fzf', {'dir': '~./fzf', 'do': './install --all'}
Plugin 'junegunn/fzf.vim'

" -------- Structure and Organisation --------------------------------------------------------------
"Plugin 'dense-analysis/ale'
"Plugin 'maralla/completor.vim'
Plugin 'jnurmine/Zenburn'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'jceb/vim-orgmode'
 Plugin 'vim-pandoc/vim-pandoc'
 Plugin 'vim-pandoc/vim-pandoc-syntax'
" Plugin 'oberblastmeister/neuron.nvim'
Plugin 'nvim-telescope/telescope.nvim'

" -------- Programming support ---------------------------------------------------------------------
"Plugin 'scrooloose/syntastic'
"Plugin 'w0rp/ale'
Plugin 'tmhedberg/SimpylFold'
Plugin 'tpope/vim-fugitive'
" ---- I give up on native lsp for a moment for the following reasons:
"  - keeping rust-analyzer up to date manually is annoying
"  - setting up for ANY programming language is complicated, no out-of-the-box solution
"  - couldn't get eclipse ls to run at all
"Plugin 'neovim/nvim-lspconfig'
"Plugin 'nvim-lua/lsp_extensions.nvim'
"Plugin 'nvim-lua/popup.nvim'
"Plugin 'nvim-lua/plenary.nvim'
"Plugin 'nvim-lua/lsp-status.nvim'
"Plugin 'nvim-lua/completion-nvim'
" ---- instead, use CoC ----------------------------------------------------------------------------
Plugin 'neoclide/coc.nvim'
Plugin 'williamboman/nvim-lsp-installer'
" ---- cod completion ------------------------------------------------------------------------------
Plugin 'Exafunction/codeium.vim'
" --------------------------------------------------------------------------------------------------
Plugin 'hrsh7th/cmp-nvim-lsp', {'branch': 'main'}
Plugin 'hrsh7th/cmp-buffer', {'branch': 'main'}
Plugin 'hrsh7th/cmp-path', {'branch': 'main'}
Plugin 'hrsh7th/nvim-cmp', {'branch': 'main'}
Plugin 'ray-x/lsp_signature.nvim'

" Only because nvim-cmp _requires_ snippets
Plugin 'hrsh7th/cmp-vsnip', {'branch': 'main'}
Plugin 'hrsh7th/vim-vsnip'

" -------- Syntax --------------------------------
"  general
let g:polyglot_disabled=['md', 'markdown']
Plugin 'sheerun/vim-polyglot'
Plugin 'stephpy/vim-yaml'
"Plugin 'fatih/vim-go'
Plugin 'dag/vim-fish'
Plugin 'godlygeek/tabular'
" markdown
" let g:vim_markdown_fenced_languages = ['python','py=python', 'cpp', 'java']
" let g:markdown_fenced_languages = ['python','py=python', 'cpp', 'java']
" Plugin 'preservim/vim-markdown'
" rust
Plugin 'cespare/vim-toml'
Plugin 'simrat39/rust-tools.nvim'
" Plugin 'saecki/crates.nvim'
" python
Plugin 'nvie/vim-flake8'
Plugin 'vim-scripts/indentpython.vim'
" c/c++
"Plugin 'rhysd/vim-clang-format'
Plugin 'p00f/clangd_extensions.nvim'
" java

Plugin 'kshenoy/vim-signature'

" -------- REPL 
" Plugin 'jpalardy/vim-slime'
"Plugin 'untitled-ai/jupyter_ascending.vim'
"Plugin 'bfredl/nvim-ipy'
"Plugin 'hkupty/iron.nvim'
"Plugin 'GCBallesteros/jupytext.vim'
"Plugin 'kana/vim-textobj-line'
"Plugin 'kana/vim-textobj-user'
"Plugin 'GCBallesteros/vim-textobj-hydrogen'

" -------- Latex -----------------------------------------------------------------------------------
Plugin 'lervag/vimtex'
Plugin 'Konfekt/FastFold'
Plugin 'matze/vim-tex-fold'

" -------- OrgMode ---------------------------------------------------------------------------------
Plugin 'nvim-treesitter/nvim-treesitter'
Plugin 'nvim-orgmode/orgmode'


" -------- Colorschemes ----------------------------------------------------------------------------
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
Plugin 'franbach/miramare'
Plugin 'dfrunza/vim'
Plugin 'sainnhe/gruvbox-material'
Plugin 'arcticicestudio/nord-vim'
Plugin 'folke/tokyonight.nvim', { 'branch': 'main' }


" -------- End Vundlde -----------------------------------------------------------------------------

call vundle#end()            " required
filetype plugin indent on    " required


" -----------------------------------------------------------------------------------------------}}}
" -{{{---- Python ----------------------------------------------------------------------------------
" --------------------------------------------------------------------------------------------------

"python with virtualenv support

let python_highlight_all=1


" -----------------------------------------------------------------------------------------------}}}
" -{{{---- Appearance ------------------------------------------------------------------------------
" --------------------------------------------------------------------------------------------------

set termguicolors
set background=dark
"colorscheme snow
let g:miramare_enable_italic=1
let g:miramare_disable_italic_comment=1
"colorscheme miramare
let g:gruvbox_material_background = 'soft'
"colorscheme gruvbox-material
"colorscheme nord
colorscheme tokyonight-storm
set noshowmode

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

let g:cym_rust_src_path = '/mnt/c/Users/andiw/.rustup/toolchains/stable-x86_64-pc-windows-msvc/lib/rustlib/src/rust/src'

let termwinsize = 20

nnoremap <C-F8> :botright split <CR> :resize 20 <CR> :terminal ++curwin <CR>


" Plugin settings
let g:secure_modelines_allowed_items = [
                \ "textwidth",   "tw",
                \ "softtabstop", "sts",
                \ "tabstop",     "ts",
                \ "shiftwidth",  "sw",
                \ "expandtab",   "et",   "noexpandtab", "noet",
                \ "filetype",    "ft",
                \ "foldmethod",  "fdm",
                \ "readonly",    "ro",   "noreadonly", "noro",
                \ "rightleft",   "rl",   "norightleft", "norl",
                \ "colorcolumn"
                \ ]

" Lightline
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified' ] ],
      \   'right': [ [ 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'fileencoding', 'filetype' ] ],
      \ },
      \ 'component_function': {
      \   'filename': 'LightlineFilename'
      \ },
      \ }
function! LightlineFilename()
  return expand('%:t') !=# '' ? @% : '[No Name]'
endfunction

" Completion
" Better completion
" menuone: popup even when there's only one match
" noinsert: Do not insert text until a selection is made
" noselect: Do not select, force user to select one from the menu
set completeopt=menuone,noinsert,noselect
" Better display for messages
set cmdheight=2
" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300
  " -- See `:help vim.lsp.*` for documentation on any of the below functions
  " buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  " buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  " buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  " buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  " buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  " buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  " buf_set_keymap('n', '<space>r', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  " buf_set_keymap('n', '<space>a', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  " buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  " buf_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
  " buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  " buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  " buf_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.set_loclist()<CR>', opts)
  " buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

" Code navigation shortcuts
" nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
" nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
" nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
" nnoremap <silent> gd    <cmd>lua vim.lsp.buf.definition()<CR>
" nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
" nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
" nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
" nnoremap <silent> gR    <cmd>lua vim.lsp.buf.rename()<CR>
" nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
" nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
" nnoremap <silent> 1gd    <cmd>lua vim.lsp.buf.declaration()<CR>
" nnoremap <silent> ga    <cmd>lua vim.lsp.buf.code_action()<CR>
" nnoremap <silent> [d    <cmd>lua vim.diagnostic.goto_next()<CR>
" nnoremap <silent> ]d    <cmd>lua vim.diagnostic.goto_prev()<CR>
" nnoremap <silent> [e    <cmd>lua vim.diagnostic.open_float()<CR>
" nnoremap <silent> F    <cmd>lua vim.lsp.buf.formatting()<CR>
" --------------------------------------------------------------------------------------------------
" ---- Coc -----------------------------------------------------------------------------------------
" --------------------------------------------------------------------------------------------------
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

nnoremap <silent> K     :call ShowDocumentation()<CR>
nnoremap <silent> gD    <Plug>(coc-implementation)
nnoremap <silent> gd    <Plug>(coc-definition)
nnoremap <silent> 1gD   <Plug>(coc-type-definition)
nnoremap <silent> gr    <Plug>(coc-references)
nnoremap <silent> gR    <Plug>(coc-rename)
nnoremap <silent> ga    <Plug>(coc-codeaction-selected)<CR>
nnoremap <silent> gA    <Plug>(coc-fix-current)
nnoremap <silent> gl    <Plug>(coc-codelens-action)
nnoremap <silent> [d    <Plug>(coc-diagnostic-prev)
nnoremap <silent> ]d    <Plug>(coc-diagnostic-next)
nnoremap <silent> F    :call CocActionAsync('format')<CR>
" Use <Tab> and <S-Tab> to navigate through popup menu
" inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Set updatetime for CursorHold
" 300ms of no cursor movement to trigger CursorHold
set updatetime=100
" Show diagnostic popup on cursor hold
"autocmd CursorHold * lua vim.lsp.diagnostic.open_float()

" Goto previous/next diagnostic warning/error
nnoremap <silent> g[ <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> g] <cmd>lua vim.lsp.diagnostic.goto_next()<CR>


" have a fixed column for the diagnostics to appear in
" this removes the jitter when warnings/errors flow in
set signcolumn=yes

hi InlayHint gui=italic guifg=Gray cterm=italic ctermfg=Gray
"let g:ycm_language_server =
"            \ [
"            \  {
"            \   'name': 'rust',
"            \   'cmdline': [rust-analyzer'],
"            \   'filetypes': ['rust'],
"            \   'project_root_files': ['Cargo.toml']
"            \  }
"            \ ]

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
" -{{{---- Markdown --------------------------------------------------------------------------------
" --------------------------------------------------------------------------------------------------

let g:pandoc#syntax#codeblocks#embeds#langs = ["python", "sh", "bash", "c", "cpp", "vim", "latex", "rust", "html", "java"]

" " -----------------------------------------------------------------------------------------------}}}
" " -{{{---- Status Line -----------------------------------------------------------------------------
" " --------------------------------------------------------------------------------------------------
"
let g:lightline = {}

let g:lightline.component_expand = {
      \  'linter_hints': 'lightline#lsp#hints',
      \  'linter_infos': 'lightline#lsp#infos',
      \  'linter_warnings': 'lightline#lsp#warnings',
      \  'linter_errors': 'lightline#lsp#errors',
      \  'linter_ok': 'lightline#lsp#ok',
      \ }

let g:lightline.component = {
      \  'helloworld': 'Hello world',
      \ }

let g:lightline.component_function = {
      \   'gitbranch': 'FugitiveHead'
      \ }
"
let g:lightline.component_type = {
      \     'linter_hints': 'right',
      \     'linter_infos': 'right',
      \     'linter_warnings': 'warning',
      \     'linter_errors': 'error',
      \     'linter_ok': 'right',
      \     'gitbranch': 'right',
      \     'helloworld': 'right',
      \ }
"
let g:lightline.active = {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ],
      \             [ 'linter_hints', 'linter_errors', 'linter_warnings', 'linter_ok'] ,
      \           ]
      \ }

" " -----------------------------------------------------------------------------------------------}}}
" " -{{{---- Crates ----------------------------------------------------------------------------------
" " --------------------------------------------------------------------------------------------------
""  lua << END
""  require('crates').setup {
""      smart_insert = true,
""      insert_closing_quote = true,
""      avoid_prerelease = true,
""      autoload = true,
""      autoupdate = true,
""      loading_indicator = true,
""      date_format = "%Y-%m-%d",
""      thousands_separator = ".",
""      notification_title = "Crates",
""      disable_invalid_feature_diagnostic = false,
""      text = {
""          loading = "  Loading",
""          version = "  v %s",
""          prerelease = "  pre %s",
""          yanked = "  y %s",
""          nomatch = "  No match",
""          upgrade = "  u %s",
""          error = "  Error fetching crate",
""      },
""      highlight = {
""          loading = "CratesNvimLoading",
""          version = "CratesNvimVersion",
""          prerelease = "CratesNvimPreRelease",
""          yanked = "CratesNvimYanked",
""          nomatch = "CratesNvimNoMatch",
""          upgrade = "CratesNvimUpgrade",
""          error = "CratesNvimError",
""      },
""      popup = {
""          autofocus = false,
""          copy_register = '"',
""          style = "minimal",
""          border = "none",
""          show_version_date = false,
""          show_dependency_version = true,
""          max_height = 30,
""          min_width = 20,
""          padding = 1,
""          text = {
""              title = "# %s",
""              pill_left = "<",
""              pill_right = "<",
""              description = "%s",
""              created_label = "created        ",
""              created = "%s",
""              updated_label = "updated        ",
""              updated = "%s",
""              downloads_label = "downloads      ",
""              downloads = "%s",
""              homepage_label = "homepage       ",
""              homepage = "%s",
""              repository_label = "repository     ",
""              repository = "%s",
""              documentation_label = "documentation  ",
""              documentation = "%s",
""              crates_io_label = "crates.io      ",
""              crates_io = "%s",
""              categories_label = "categories     ",
""              keywords_label = "keywords       ",
""              version = "  %s",
""              prerelease = "%s",
""              yanked = "%s",
""              version_date = "  %s",
""              feature = "  %s",
""              enabled = "%s",
""              transitive = "%s",
""              normal_dependencies_title = "Dependencies",
""              build_dependencies_title = "Build dependencies",
""              dev_dependencies_title = "Dev dependencies",
""              dependency = "  %s",
""              optional = "%s",
""              dependency_version = "  %s",
""              loading = "...",
""          },
""          highlight = {
""              title = "CratesNvimPopupTitle",
""              pill_text = "CratesNvimPopupPillText",
""              pill_border = "CratesNvimPopupPillBorder",
""              description = "CratesNvimPopupDescription",
""              created_label = "CratesNvimPopupLabel",
""              created = "CratesNvimPopupValue",
""              updated_label = "CratesNvimPopupLabel",
""              updated = "CratesNvimPopupValue",
""              downloads_label = "CratesNvimPopupLabel",
""              downloads = "CratesNvimPopupValue",
""              homepage_label = "CratesNvimPopupLabel",
""              homepage = "CratesNvimPopupUrl",
""              repository_label = "CratesNvimPopupLabel",
""              repository = "CratesNvimPopupUrl",
""              documentation_label = "CratesNvimPopupLabel",
""              documentation = "CratesNvimPopupUrl",
""              crates_io_label = "CratesNvimPopupLabel",
""              crates_io = "CratesNvimPopupUrl",
""              categories_label = "CratesNvimPopupLabel",
""              keywords_label = "CratesNvimPopupLabel",
""              version = "CratesNvimPopupVersion",
""              prerelease = "CratesNvimPopupPreRelease",
""              yanked = "CratesNvimPopupYanked",
""              version_date = "CratesNvimPopupVersionDate",
""              feature = "CratesNvimPopupFeature",
""              enabled = "CratesNvimPopupEnabled",
""              transitive = "CratesNvimPopupTransitive",
""              normal_dependencies_title = "CratesNvimPopupNormalDependenciesTitle",
""              build_dependencies_title = "CratesNvimPopupBuildDependenciesTitle",
""              dev_dependencies_title = "CratesNvimPopupDevDependenciesTitle",
""              dependency = "CratesNvimPopupDependency",
""              optional = "CratesNvimPopupOptional",
""              dependency_version = "CratesNvimPopupDependencyVersion",
""              loading = "CratesNvimPopupLoading",
""          },
""          keys = {
""              hide = { "q", "<esc>" },
""              open_url = { "<cr>" },
""              select = { "<cr>" },
""              select_alt = { "s" },
""              toggle_feature = { "<cr>" },
""              copy_value = { "yy" },
""              goto_item = { "gd", "K", "<C-LeftMouse>" },
""              jump_forward = { "<c-i>" },
""              jump_back = { "<c-o>", "<C-RightMouse>" },
""          },
""      },
""      src = {
""          insert_closing_quote = true,
""          text = {
""              prerelease = "  pre-release ",
""              yanked = "  yanked ",
""          },
""          coq = {
""              enabled = false,
""              name = "Crates",
""          },
""      },
""      null_ls = {
""          enabled = false,
""          name = "Crates",
""      },
""  }
""  
""  END
""  
""  nnoremap <silent> <leader>ct :lua require('crates').toggle()<cr>
""  nnoremap <silent> <leader>cr :lua require('crates').reload()<cr>
""  
""  nnoremap <silent> <leader>cv :lua require('crates').show_versions_popup()<cr>
""  nnoremap <silent> <leader>cf :lua require('crates').show_features_popup()<cr>
""  nnoremap <silent> <leader>cd :lua require('crates').show_dependencies_popup()<cr>
""  
""  nnoremap <silent> <leader>cu :lua require('crates').update_crate()<cr>
""  vnoremap <silent> <leader>cu :lua require('crates').update_crates()<cr>
""  nnoremap <silent> <leader>ca :lua require('crates').update_all_crates()<cr>
""  nnoremap <silent> <leader>cU :lua require('crates').upgrade_crate()<cr>
""  vnoremap <silent> <leader>cU :lua require('crates').upgrade_crates()<cr>
""  nnoremap <silent> <leader>cA :lua require('crates').upgrade_all_crates()<cr>
""  
""  nnoremap <silent> <leader>cH :lua require('crates').open_homepage()<cr>
""  nnoremap <silent> <leader>cR :lua require('crates').open_repository()<cr>
""  nnoremap <silent> <leader>cD :lua require('crates').open_documentation()<cr>
""  nnoremap <silent> <leader>cC :lua require('crates').open_crates_io()<cr>
""  
" " -----------------------------------------------------------------------------------------------}}}
" " -{{{---- Organisation ----------------------------------------------------------------------------
" " --------------------------------------------------------------------------------------------------
lua << EOF

-- Load custom tree-sitter grammar for org filetype
require('orgmode').setup_ts_grammar()

-- Tree-sitter configuration
require'nvim-treesitter.configs'.setup {
  -- If TS highlights are not enabled at all, or disabled via `disable` prop, highlighting will fallback to default Vim syntax highlighting
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = {'org'}, -- Required for spellcheck, some LaTex highlights and code block highlights that do not have ts grammar
    disable = { "c", "c++", "rust", "md", "markdown", "vim" },
  },
  ensure_installed = {'org'}, -- Or run :TSUpdate org
}

require('orgmode').setup({
  org_agenda_files = {'~/org/*', '~/my-orgs/**/*'},
  org_default_notes_file = '~/org/notes.org',
})
EOF

" " -----------------------------------------------------------------------------------------------}}}
" " -{{{---- REPL ------------------------------------------------------------------------------------
" " --------------------------------------------------------------------------------------------------
"" "" lua << END
"" ---- IRON-REPL ----------------------------------------------------------------
"" 
"" local iron = require("iron.core")
"" 
"" iron.setup {
""   config = {
""     -- Whether a repl should be discarded or not
""     scratch_repl = true,
""     -- Your repl definitions come here
""     repl_definition = {
""       sh = {
""         command = {"zsh"}
""       },
""       python = {
""         command = "pipenv run ipython"
""       }
""     },
""     -- How the repl window will be displayed
""     -- See below for more information
""     repl_open_cmd = require('iron.view').bottom(40),
""   },
""   -- Iron doesn't set keymaps by default anymore.
""   -- You can set them here or manually add keymaps to the functions in iron.core
""   keymaps = {
""     send_motion = "<space>sc",
""     visual_send = "<space>sc",
""     send_file = "<space>sf",
""     send_line = "<space>sl",
""     send_mark = "<space>sm",
""     mark_motion = "<space>mc",
""     mark_visual = "<space>mc",
""     remove_mark = "<space>md",
""     cr = "<space>s<cr>",
""     interrupt = "<space>s<space>",
""     exit = "<space>sq",
""     clear = "<space>cl",
""   },
""   -- If the highlight is on, you can change how it looks
""   -- For the available options, check nvim_set_hl
""   highlight = {
""     italic = true
""   }
"" }
"" 
"" vim.cmd [[nnoremap <silent><c-v> <Plug>(iron-visual-send)]]
"" vim.cmd [[nnoremap <C-l> <Plug>(iron-send-line)]]
"" 
"" ---- NVIM-IPY -----------------------------------------------------------------
"" 
"" vim.g.nvim_ipy_perform_mappings = 0
"" vim.g.ipy_celldef = '# %%'
"" 
"" vim.cmd [[map <silent><c-s> <Plug>(IPy-Run)]]
"" vim.cmd [[map <leader>rc <Plug>(IPy-RunCell)]]
"" 
"" END

function! GetKernelFromPipenv()
    let a:kernel = tolower(system('basename $(pipenv --venv)'))
    " Remove control characters (most importantly newline)
    return substitute(a:kernel, '[[:cntrl:]]', '', 'g')
endfunction

function! ConnectToPipenvKernel()
    let a:kernel = GetKernelFromPipenv()
    call IPyConnect('--kernel', a:kernel, '--no-window')
endfunction

function! AddFilepathToSyspath()
    let a:filepath = expand('%:p:h')
    call IPyRun('import sys; sys.path.append("' . a:filepath . '")')
    echo 'Added ' . a:filepath . ' to pythons sys.path'
endfunction

command! -nargs=0 ConnectToPipenvKernel call ConnectToPipenvKernel()
command! -nargs=0 RunQtConsole call jobstart("jupyter qtconsole --existing")
command! -nargs=0 AddFilepathToSyspath call AddFilepathToSyspath()

" -----------------------------------------------------------------------------------------------}}}
"
" -----------------------------------------------------------------------------------------------}}}
" -{{{---- LSP -------------------------------------------------------------------------------------
" --------------------------------------------------------------------------------------------------
"

"

"" set completeopt=menuone,noinsert,noselect
"" 
"" " Avoid showing extra messages when using completion
"" set shortmess+=c
"" 
""  lua << END
""  
""  require("nvim-lsp-installer").setup()
""  
""  -- Setup lspconfig.
""  local on_attach = function(client, bufnr)
""    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
""    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
""  
""    --Enable completion triggered by <c-x><c-o>
""    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
""  
""    -- Mappings.
""    local opts = {
""          noremap=true,
""          silent=true,
""          autoSetHints = true,
""          hover_with_actions = true,
""          inlay_hints = {
""              show_parameter_hints = false,
""              parameter_hints_prefix = "",
""              other_hints_prefix = "",
""          },
""      }
""  
""    -- -- See `:help vim.lsp.*` for documentation on any of the below functions
""    -- buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
""    -- buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
""    -- buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
""    -- buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
""    -- buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
""    -- buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
""    -- buf_set_keymap('n', '<space>r', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
""    -- buf_set_keymap('n', '<space>a', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
""    -- buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
""    -- buf_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
""    -- buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
""    -- buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
""    -- buf_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.set_loclist()<CR>', opts)
""    -- buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
""  
""    -- Get signatures (and _only_ signatures) when in argument lists.
""    require "lsp_signature".on_attach({
""      doc_lines = 0,
""      handler_opts = {
""        border = "none"
""      },
""    })
""  end
""  
""  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
""  
""  local lspconfig = require'lspconfig'
""  
""  -- ---- Rust ---------------------------------------------------------------------------------------
""  lspconfig.rust_analyzer.setup {
""    on_attach = on_attach,
""    flags = {
""      debounce_text_changes = 150,
""    },
""    settings = {
""      ["rust-analyzer"] = {
""        cargo = {
""          allFeatures = true,
""        },
""        completion = {
""  	postfix = {
""  	  enable = false,
""  	},
""        },
""      },
""    },
""    capabilities = capabilities,
""  }
""  
""  local opts = {
""      tools = { -- rust-tools options
""      },
""  
""      -- all the opts to send to nvim-lspconfig
""      -- these override the defaults set by rust-tools.nvim
""      -- see https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#rust_analyzer
""      server = {
""          -- on_attach is a callback called when the language server attachs to the buffer
""          -- on_attach = on_attach,
""          settings = {
""              -- to enable rust-analyzer settings visit:
""              -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
""              ["rust-analyzer"] = {
""                  -- enable clippy on save
""                  checkOnSave = {
""                      command = "clippy"
""                  },
""              }
""          }
""      },
""  }
""  
""  require('rust-tools').setup(opts)
""  
""  -- ---- C++ ----------------------------------------------------------------------------------------
""  
""  -- lspconfig.clangd.setup{
""  --     on_attach=on_attach,
""  --     capabilities=capabilities,
""  -- }
""  
""  require("clangd_extensions").setup {
""      server = {
""        on_attach=on_attach,
""        capabilities=capabilities,
""          -- options to pass to nvim-lspconfig
""          -- i.e. the arguments to require("lspconfig").clangd.setup({})
""      },
""      extensions = {
""          -- defaults:
""          -- Automatically set inlay hints (type hints)
""          autoSetHints = true,
""          -- These apply to the default ClangdSetInlayHints command
""          inlay_hints = {
""              -- Only show inlay hints for the current line
""              only_current_line = false,
""              -- Event which triggers a refersh of the inlay hints.
""              -- You can make this "CursorMoved" or "CursorMoved,CursorMovedI" but
""              -- not that this may cause  higher CPU usage.
""              -- This option is only respected when only_current_line and
""              -- autoSetHints both are true.
""              only_current_line_autocmd = "CursorHold",
""              -- whether to show parameter hints with the inlay hints or not
""              show_parameter_hints = true,
""              -- prefix for parameter hints
""              parameter_hints_prefix = "<- ",
""              -- prefix for all the other hints (type, chaining)
""              other_hints_prefix = "=> ",
""              -- whether to align to the length of the longest line in the file
""              max_len_align = false,
""              -- padding from the left if max_len_align is true
""              max_len_align_padding = 1,
""              -- whether to align to the extreme right or not
""              right_align = false,
""              -- padding from the right if right_align is true
""              right_align_padding = 7,
""              -- The color of the hints
""              highlight = "Comment",
""              -- The highlight group priority for extmark
""              priority = 100,
""          },
""          ast = {
""              -- These are unicode, should be available in any font
""              role_icons = {
""                   type = "🄣",
""                   declaration = "🄓",
""                   expression = "🄔",
""                   statement = ";",
""                   specifier = "🄢",
""                   ["template argument"] = "🆃",
""              },
""              kind_icons = {
""                  Compound = "🄲",
""                  Recovery = "🅁",
""                  TranslationUnit = "🅄",
""                  PackExpansion = "🄿",
""                  TemplateTypeParm = "🅃",
""                  TemplateTemplateParm = "🅃",
""                  TemplateParamObject = "🅃",
""              },
""              --[[ These require codicons (https://github.com/microsoft/vscode-codicons)
""              role_icons = {
""                  type = "",
""                  declaration = "",
""                  expression = "",
""                  specifier = "",
""                  statement = "",
""                  ["template argument"] = "",
""              },
""  
""              kind_icons = {
""                  Compound = "",
""                  Recovery = "",
""                  TranslationUnit = "",
""                  PackExpansion = "",
""                  TemplateTypeParm = "",
""                  TemplateTemplateParm = "",
""                  TemplateParamObject = "",
""              }, ]]
""  
""              highlights = {
""                  detail = "Comment",
""              },
""          },
""          memory_usage = {
""              border = "none",
""          },
""          symbol_info = {
""              border = "none",
""          },
""      },
""  }
""  
""  -- ---- Latex LSP ----------------------------------------------------------------------------------
""  
""  lspconfig.texlab.setup{
""      on_attach=on_attach,
""      capabilities=capabilities,
""  }
""  
""  -- ---- Python -------------------------------------------------------------------------------------
""  lspconfig.pyls.setup{
""      on_attach=on_attach,
""      capabilities=capabilities,
""  }
""  
""  vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
""    vim.lsp.diagnostic.on_publish_diagnostics, {
""      virtual_text = true,
""      signs = true,
""      update_in_insert = true,
""    }
""  )
""  END
""  
""  " ---- Snip Run ------------------------------------------------------------------------------------
""  
""  lua << END
""  
""  require'sniprun'.setup({selected_interpreters={Python3}})
""  
""  local cmp = require'cmp'
""  cmp.setup({
""    -- Enable LSP snippets
""    snippet = {
""      expand = function(args)
""          vim.fn["vsnip#anonymous"](args.body)
""      end,
""    },
""    mapping = {
""      ['<C-p>'] = cmp.mapping.select_prev_item(),
""      ['<C-n>'] = cmp.mapping.select_next_item(),
""      -- Add tab support
""       ["<Tab>"] = cmp.mapping(function(fallback)
""           if cmp.visible() then
""               cmp.select_next_item()
""           else
""               fallback()
""           end
""       end, {"i", "s"}),
""  
""       ["<S-Tab>"] = cmp.mapping(function(fallback)
""           if cmp.visible() then
""               cmp.select_prev_item()
""           else
""               fallback()
""           end
""       end, {"i", "s"}),
""      ['<C-d>'] = cmp.mapping.scroll_docs(-4),
""      ['<C-f>'] = cmp.mapping.scroll_docs(4),
""      ['<C-Space>'] = cmp.mapping.complete(),
""      ['<C-e>'] = cmp.mapping.close(),
""      ['<CR>'] = cmp.mapping.confirm({
""        behavior = cmp.ConfirmBehavior.Insert,
""        select = true,
""      })
""    },
""  
""    -- Installed sources
""    sources = {
""      { name = 'nvim_lsp' },
""      { name = 'vsnip' },
""      { name = 'path' },
""      { name = 'buffer' },
""      { name = 'latex' },
""      { name = 'orgmode' },
""    },
""  })
""  
""  
""  END
""  " Enable type inlay hints
""  "autocmd CursorHold,CursorHoldI *.rs :lua require'lsp_extensions'.inlay_hints{ only_current_line = true }

