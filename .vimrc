" vim:fdm=marker
" -{{{---- filetypes
"
"
set hidden

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
if has('win32')
    set shell=powershell.exe
endif

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
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" -------- Vim itself ------------------------------------------------------------------------------
Plugin 'ciaranm/securemodelines'
Plugin 'itchyny/lightline.vim'
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
Plugin 'oberblastmeister/neuron.nvim'
Plugin 'nvim-telescope/telescope.nvim'

" -------- Programming support ---------------------------------------------------------------------
"Plugin 'scrooloose/syntastic'
"Plugin 'w0rp/ale'
Plugin 'tmhedberg/SimpylFold'
Plugin 'tpope/vim-fugitive'
Plugin 'neovim/nvim-lspconfig'
Plugin 'nvim-lua/lsp_extensions.nvim'
Plugin 'nvim-lua/popup.nvim'
Plugin 'nvim-lua/plenary.nvim'
"Plugin 'nvim-lua/completion-nvim'
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
Plugin 'sheerun/vim-polyglot'
Plugin 'stephpy/vim-yaml'
"Plugin 'fatih/vim-go'
Plugin 'dag/vim-fish'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
" rust
Plugin 'cespare/vim-toml'
Plugin 'simrat39/rust-tools.nvim'
Plugin 'mhinz/vim-crates'
" python
Plugin 'nvie/vim-flake8'
Plugin 'vim-scripts/indentpython.vim'
" c/c++
Plugin 'rhysd/vim-clang-format'

Plugin 'kshenoy/vim-signature'

" -------- Latex ---------------------------------
Plugin 'lervag/vimtex'
Plugin 'vim-latex/vim-latex' 

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
colorscheme gruvbox-material

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


" -----------------------------------------------------------------------------------------------}}}
" -{{{---- LSP -------------------------------------------------------------------------------------
" --------------------------------------------------------------------------------------------------
"
"
set completeopt=menuone,noinsert,noselect

" Avoid showing extra messages when using completion
set shortmess+=c

lua << END

-- Setup lspconfig.
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  --Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = {
        noremap=true,
        silent=true,
        autoSetHints = true,
        hover_with_actions = true,
        inlay_hints = {
            show_parameter_hints = false,
            parameter_hints_prefix = "",
            other_hints_prefix = "",
        },
    }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>r', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>a', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

  -- Get signatures (and _only_ signatures) when in argument lists.
  require "lsp_signature".on_attach({
    doc_lines = 0,
    handler_opts = {
      border = "none"
    },
  })
end

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

local lspconfig = require'lspconfig'

-- ---- Rust ---------------------------------------------------------------------------------------
lspconfig.rust_analyzer.setup {
  on_attach = on_attach,
  flags = {
    debounce_text_changes = 150,
  },
  settings = {
    ["rust-analyzer"] = {
      cargo = {
        allFeatures = true,
      },
      completion = {
	postfix = {
	  enable = false,
	},
      },
    },
  },
  capabilities = capabilities,
}

local opts = {
    tools = { -- rust-tools options
    },

    -- all the opts to send to nvim-lspconfig
    -- these override the defaults set by rust-tools.nvim
    -- see https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#rust_analyzer
    server = {
        -- on_attach is a callback called when the language server attachs to the buffer
        -- on_attach = on_attach,
        settings = {
            -- to enable rust-analyzer settings visit:
            -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
            ["rust-analyzer"] = {
                -- enable clippy on save
                checkOnSave = {
                    command = "clippy"
                },
            }
        }
    },
}

require('rust-tools').setup(opts)

-- ---- C++ ----------------------------------------------------------------------------------------

lspconfig.clangd.setup{
    on_attach=on_attach,
    capabilities=capabilities,
}

-- ---- Python -------------------------------------------------------------------------------------
lspconfig.jedi_language_server.setup{
    on_attach=on_attach,
    capabilities=capabilities,
}

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = true,
    signs = true,
    update_in_insert = true,
  }
)
END

" ---- Snip Run ------------------------------------------------------------------------------------

lua << END

require'sniprun'.setup({selected_interpreters={Python3}})

local cmp = require'cmp'
cmp.setup({
  -- Enable LSP snippets
  snippet = {
    expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    -- Add tab support
     ["<Tab>"] = cmp.mapping(function(fallback)
         if cmp.visible() then
             cmp.select_next_item()
         else
             fallback()
         end
     end, {"i", "s"}),

     ["<S-Tab>"] = cmp.mapping(function(fallback)
         if cmp.visible() then
             cmp.select_prev_item()
         else
             fallback()
         end
     end, {"i", "s"}),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    })
  },

  -- Installed sources
  sources = {
    { name = 'nvim_lsp' },
    { name = 'vsnip' },
    { name = 'path' },
    { name = 'buffer' },
  },
})

END
" Enable type inlay hints
"autocmd CursorHold,CursorHoldI *.rs :lua require'lsp_extensions'.inlay_hints{ only_current_line = true }

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

" Code navigation shortcuts
nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> ga    <cmd>lua vim.lsp.buf.code_action()<CR>

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"


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
" -{{{---- Organisation ----------------------------------------------------------------------------
" --------------------------------------------------------------------------------------------------
lua << EOF
-- these are all the default values
require'neuron'.setup {
    virtual_titles = true,
    mappings = true,
    run = nil, -- function to run when in neuron dir
    neuron_dir = "~/neuron", -- the directory of all of your notes, expanded by default (currently supports only one directory for notes, find a way to detect neuron.dhall to use any directory)
    leader = "gz", -- the leader key to for all mappings, remember with 'go zettel'
}

EOF

" -----------------------------------------------------------------------------------------------}}}
