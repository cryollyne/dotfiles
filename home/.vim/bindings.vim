let mapleader = "\<SPACE>"
let maplocalleader = ","

" forwards delete
inoremap <c-n> <right><BS>
inoremap <c-p> <right><esc>dwi

nnoremap <c-u> <c-u>zz
nnoremap <c-d> <c-d>zz
nnoremap n nzz
nnoremap N Nzz

inoremap jk <esc>

" changes ^H and ^J to literal backspace and literal carriage return
" up and down bindings
imap <c-h> <BS>
cmap <c-h> <BS>

" make search not do regex search
nnoremap / /\V
nnoremap ? ?\V
nnoremap ?? ??
nnoremap // //

if !has("nvim")
    imap <expr> <c-j> coc#pum#visible() ? coc#pum#next(1) : "\<cr>"
    imap <expr> <c-k> coc#pum#visible() ? coc#pum#prev(1) : "\<up>"
else
    imap  <c-j> <cr>
endif
cnoremap <c-k> <up>

" visual mode keep selection
vmap > >gv
vmap < <gv

" clears highlight
nnoremap <C-L> :nohlsearch<CR>:silent<SPACE>!:<CR><C-L>


" ctrl-p to fuzzy find a file in new tab
if has("nvim")
    nnoremap <c-p> <cmd>Telescope find_files<cr>
    nnoremap <leader><c-p> <cmd>Telescope live_grep<cr>
else
    nnoremap <c-p> :Files<cr>
endif

" move line up or down
vnoremap <c-j> <esc>`>jdd`<Pgv
vnoremap <c-k> <esc>`<kdd`>pgv
nnoremap <c-k> ddkP
nnoremap <c-j> ddp

" marks jump to position on line instead of start of line
nnoremap ' `

function! ToggleConcealLevel()
    if (&conceallevel == 2)
        set conceallevel=0
    else
        set conceallevel=2
    endif
endfunction
function! ToggleColorColumn()
    if (&colorcolumn == 80)
        set colorcolumn=
    else
        set colorcolumn=80
    endif
endfunction
nnoremap <expr> <leader>tcl ToggleConcealLevel()
nnoremap <expr> <leader>tcc ToggleColorColumn()

" remove tailing whitespace
nnoremap <silent> <leader>s :%s/\([^ \t]\)\@<=[ \t]\+$//e<CR>
nnoremap <silent> <leader>ls :s/\([^ \t]\)\@<=[ \t]\+$//e<CR>

" netrw bindings
augroup netrw_bindings
    au!
    au FileType netrw nmap <buffer> <c-j> <cr>
augroup END
