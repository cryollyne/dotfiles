augroup abreviations
    autocmd!
    autocmd BufNewFile,BufRead *.cs iabbrev dt Time.deltaTime
    autocmd BufNewFile,BufRead *.cs iabbrev fdt Time.fixedDeltaTime
    autocmd BufNewFile,BufRead *.tex iabbrev cof coefficient of friction
    autocmd BufNewFile,BufRead *.tex iabbrev v0 \vec{v_0}
    autocmd BufNewFile,BufRead *.tex iabbrev v1 \vec{v_1}
    autocmd BufNewFile,BufRead *.tex iabbrev v2 \vec{v_2}
    autocmd BufNewFile,BufRead *.tex iabbrev acc \vec{a}
    autocmd BufNewFile,BufRead *.tex iabbrev fnet \vec{F}_{net}
    autocmd BufNewFile,BufRead *.tex iabbrev dd \Delta\vec{d}
    autocmd BufNewFile,BufRead *.tex iabbrev dt \Delta t

augroup END
