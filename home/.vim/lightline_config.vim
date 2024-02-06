set laststatus=2
let g:lightline = {
            \ 'colorscheme': 'wombat',
            \ 'active': {
            \   'left': [
            \       [ 'mode', 'paste' ],
            \       [ 'readonly', 'filename' ],
            \       [ 'coc_error', 'coc_warn' ],
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
            \   'coc_error': 'LightlineCocError',
            \   'coc_warn': 'LightlineCocWarn',
            \ },
            \ 'component_function': {
            \   'filename': 'LightlineFileName',
            \   'blame': 'LightlineGitBlame',
            \   'git_info': 'LightlineGitInfo',
            \ },
            \ 'component_type': {
            \   'coc_error': 'error',
            \   'coc_warn': 'warning',
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


function! LightlineCocWarn()
    let info = get(b:, 'coc_diagnostic_info', {})
    if empty(info) | return '' | endif
    if get(info, 'warning', 0)
        return info['warning'] . 'W'
    endif
    return ''
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
  let blame = get(b:, 'coc_git_blame', '')
  return blame
  " return winwidth(0) > 120 ? blame : ''
endfunction

augroup lightline#coc
  autocmd!
  autocmd User CocDiagnosticChange call lightline#update()
  autocmd User CocStatusChange call lightline#update()
augroup END
