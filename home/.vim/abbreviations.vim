augroup abreviations
    autocmd!
    autocmd BufNewFile,BufRead *.cs iabbrev dt Time.deltaTime
    autocmd BufNewFile,BufRead *.cs iabbrev fdt Time.fixedDeltaTime
    autocmd BufNewFile,BufRead *.tex iabbrev t0 t_0
    autocmd BufNewFile,BufRead *.tex iabbrev t1 t_1
    autocmd BufNewFile,BufRead *.tex iabbrev t2 t_2
    autocmd BufNewFile,BufRead *.tex iabbrev v0 \vec{v_0}
    autocmd BufNewFile,BufRead *.tex iabbrev v1 \vec{v_1}
    autocmd BufNewFile,BufRead *.tex iabbrev v2 \vec{v_2}
    autocmd BufNewFile,BufRead *.tex iabbrev v1i v_{1i}
    autocmd BufNewFile,BufRead *.tex iabbrev v2i v_{2i}
    autocmd BufNewFile,BufRead *.tex iabbrev v1f v_{1f}
    autocmd BufNewFile,BufRead *.tex iabbrev v2f v_{2f}
    autocmd BufNewFile,BufRead *.tex iabbrev acc \vec{a}
    autocmd BufNewFile,BufRead *.tex iabbrev fnet \vec{F}_{net}

augroup END
