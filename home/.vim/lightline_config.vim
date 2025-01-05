set laststatus=2
let g:lightline = {
            \ 'colorscheme': 'wombat',
            \ 'active': {
            \   'left': [
            \       [ 'mode', 'paste' ],
            \       [ 'readonly', 'filename' ],
            \       [ 'lsp_error', 'lsp_warn' ],
            \       [ 'git_info' ],
            \   ],
            \   'right':[
            \       [ 'percent' ],
            \       [ 'lineinfo' ],
            \       [ 'filetype', 'fileencoding'],
            \       [ 'blame' ],
            \   ],
            \ },
            \ 'inactive': {
            \   'left': [
            \       [ 'mode', 'paste' ],
            \       [ 'readonly', 'filename' ],
            \       [ 'coc_status' ],
            \   ],
            \   'right': [
            \       [ 'percent' ],
            \       [ 'lineinfo' ],
            \       [ 'filetype', 'fileencoding'],
            \   ]
            \ },
            \ 'component_expand': {
            \   'lsp_error': 'LightlineError',
            \   'lsp_warn': 'LightlineWarn',
            \ },
            \ 'component_function': {
            \   'filename': 'LightlineFileName',
            \   'blame': 'LightlineGitBlame',
            \   'git_info': 'LightlineGitInfo',
            \ },
            \ 'component_type': {
            \   'lsp_error': 'error',
            \   'lsp_warn': 'warning',
            \ }
            \ }

function! LightlineCocError()
    let info = get(b:, 'coc_diagnostic_info', {})
    if empty(info) | return '' | endif
    if get(info, 'error', 0)
        return info['error'] . 'E'
    endif
    return ''
endfunction

function! LightlineNvimError()
    let count = luaeval('table.getn(vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR }))')
    if (count == 0)
        return ''
    endif
    return count . 'E'
endfunction

function! LightlineError()
    if !has('nvim')
        return LightlineCocError()
    endif
    return LightlineNvimError()
endfunction


function! LightlineCocWarn()
    let info = get(b:, 'coc_diagnostic_info', {})
    if empty(info) | return '' | endif
    if get(info, 'warning', 0)
        return info['warning'] . 'W'
    endif
    return ''
endfunction

function! LightlineNvimWarn()
    let count = luaeval('table.getn(vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN }))')
    if (count == 0)
        return ''
    endif
    return count . 'W'
endfunction

function LightlineWarn()
    if !has('nvim')
        return LightlineCocWarn()
    endif
    return LightlineNvimWarn()
endfunction

function! LightlineFileName()
    let filename = expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
    let modified = &modified ? '*' : ''
    return filename . modified
endfunction

function! LightlineGitInfo()
    return get(g:, 'coc_git_status', '') . get(b:, 'coc_git_status', '')
endfunction

function! LightlineGitBlame()
    if !has('nvim')
        let blame = get(b:, 'coc_git_blame', '')
        return blame
        " return winwidth(0) > 120 ? blame : ''
    endif
    let line = line('.')
    let filename = expand('%:p')
    let dir = expand('%:h')
    let blame = system("(cd " . dir . ' && git blame -L' . line . ',' . line . ' ' . filename . ")")
    let hash = split(blame, ' ')[0]
    let message = trim(system("(cd " . dir . " && git log -n1 --format='(%ar by %cn) %h %s' " . hash . ") 2>/dev/null"))
    return message == '' ? '[No Blame Info]' : message
endfunction

augroup lightline#coc
  autocmd!
  autocmd User CocDiagnosticChange call lightline#update()
  autocmd User CocStatusChange call lightline#update()
  autocmd User DiagnosticChanged call lightline#update()
augroup END
