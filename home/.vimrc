
" vim plug {{{
call plug#begin()
" general purpose plugins
Plug 'itchyny/lightline.vim'                                    " statusline
Plug 'https://github.com/tpope/vim-commentary.git'              " comment keybind
Plug 'camspiers/lens.vim'                                       " window autoresizer
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'wellle/targets.vim'                                       " additional text objects
if !has('nvim')
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }             " file searching
    Plug 'junegunn/fzf.vim'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}             " code completion and lsp
    Plug 'tmsvg/pear-tree'
endif
if has('nvim')
    " general purpose
    Plug 'hrsh7th/nvim-cmp'
    Plug 'hrsh7th/cmp-buffer'                                   " completion
    Plug 'hrsh7th/cmp-path'
    Plug 'hrsh7th/cmp-cmdline'
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'saadparwaiz1/cmp_luasnip'
    Plug 'neovim/nvim-lspconfig'                                " lsp
    Plug 'williamboman/mason-lspconfig.nvim'
    Plug 'williamboman/mason.nvim'                              " managing lsp
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " syntax highlighting
    Plug 'windwp/nvim-autopairs'                                " automatically close brackets and quotes
    Plug 'L3MON4D3/LuaSnip', {'tag': 'v2.*', 'do': 'make install_jsregexp'} " snippet engine
    Plug 'rafamadriz/friendly-snippets'                         " snippet sources
    Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.6' }    " file searching
    Plug 'debugloop/telescope-undo.nvim'                        " undo tree

    Plug 'chentoast/marks.nvim'                                 " show marks on gutter
    Plug 'mg979/vim-visual-multi', {'branch': 'master'}         " multicursor editing
    Plug 'https://github.com/kevinhwang91/nvim-ufo.git'         " improved folding visuals
    Plug 'azratul/live-share.nvim'                              " collaborative editing

    " dependencies
    Plug 'https://github.com/kevinhwang91/promise-async.git'    " dependency of ufo
    Plug 'nvim-lua/plenary.nvim'                                " dependency of telescope
    Plug 'jbyuki/instant.nvim'                                  " dependency of live-share
endif


" C/C++
if !has('nvim')
    Plug 'https://github.com/bfrg/vim-cpp-modern.git'
    Plug 'jackguo380/vim-lsp-cxx-highlight'
endif

" latex
Plug 'lervag/vimtex'

" typst
Plug 'chomosuke/typst-preview.nvim', {'tag': 'v1.*'}

call plug#end()

" }}}

" FILETYPES {{{

augroup setFileTypes
    au!
    autocmd BufNewFile,BufRead *.qml set filetype=qmljs
    autocmd BufNewFile,BufRead *.slang set filetype=shaderslang
    autocmd BufNewFile,BufRead *.vert,*.frag,*.tesc,*.tese,*.geom,*.comp set filetype=glsl
augroup END

" }}}

" SETTINGS {{{

set nocompatible
filetype on
filetype plugin on
filetype indent on
syntax on

set number
set relativenumber

set cursorline

set shiftwidth=4
set tabstop=4
set expandtab

set nobackup

set scrolloff=15

set nowrap

set ignorecase
set smartcase

set showcmd
set noshowmode

set history=1000

set hlsearch
set incsearch
set showmatch

set foldmethod=syntax
set foldlevel=20

set conceallevel=0

set autoread

set list listchars=tab:»\ ,trail:~,nbsp:+

augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
    autocmd FileType python setlocal foldmethod=indent
    autocmd BufRead,BufNewFile makefile,Makefile,MakeFile,MAKEFILE setlocal foldmethod=indent
augroup END


function! DocumentMode()
    set textwidth=80
    set colorcolumn=80
    set spell
endfunction

augroup FiletypeSettings
    autocmd!
    autocmd FileType tex,markdown call DocumentMode()
augroup END

" }}}

" bindings {{{

    source ~/.vim/bindings.vim

    " highlight analizing
    command! WhichHi call SynStack()
    command! WhichHighlight call SynStack()

    function! SynStack()
        if !exists("*synstack")
            return
        endif
        echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
    endfunc

" }}}

" abbreviation {{{
source ~/.vim/abbreviations.vim
" }}}

" plugins {{{

if !has("nvim")
    source ~/.vim/coc.vim
endif
source ~/.vim/lightline_config.vim

" Visual Multi
let g:VM_theme = 'nord'

" lens
let g:lens#width_resize_max = 200
let g:lens#width_resize_min = 80
let g:lens#height_resize_min = 8
let g:lens#height_resize_max = 20

" vimtex
let g:vimtex_view_general_viewer = 'okular'
let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'

let g:vimtex_compiler_method = 'latexmk'

let g:vimtex_delim_toggle_mod_list = [
            \ ['\big', '\big'],
            \ ['\Big', '\Big'],
            \ ['\bigg', '\bigg'],
            \ ['\Bigg', '\Bigg'],
            \]

" let g:vimtex_compiler_latexmk_engines = '-pdf'
" }}}

" theme {{{

colorscheme catppuccin

if !has('nvim')
    " coc colors
    highlight CocInlayHint ctermfg=102 guifg=#56B6C2 ctermbg=236

    highlight! def link CocSemMacro Function
    highlight! def link CocSemStruct Type
    highlight! def link CocSemNamespace Namespace
endif

" coc-git colors
highlight DiffAdd term=bold ctermfg=114 guifg=#98C379 ctermbg=NONE guibg=NONE
highlight DiffDelete term=bold ctermfg=204 ctermbg=NONE guifg=#E06C75 guibg=NONE
highlight DiffChange term=bold cterm=NONE ctermfg=180 gui=underline guifg=#E5C07B

" }}}

" nvim {{{
if has('nvim')
    set mouse=
    set guicursor=i:block

    tnoremap <nowait> <c-n> <c-\><c-n>

    source ~/.vim/neovim_config.lua

endif
" }}}
