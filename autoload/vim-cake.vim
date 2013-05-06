if !exists('g:vim_cake_loaded') || &cp
    let g:vim_cake_loaded = 1
else
    finish
endif

func! vim_cake#CakeComplete(arglead, cmdline, cursorpos)
    let output = split(system('cake'), '\n')
    let tasks = []

    for line in output[2:-1]
        let task = split(line, ' ')[1]
        call add(tasks, task)
    endfor

    let bits = split(a:cmdline, ' ')
    if len(bits) > 1
        let word = bits[1]
        return filter(tasks, 'v:val =~ "'.word.'"')
    else
        return tasks
    endif
endf

func! vim_cake#CakePreview(task)
    pclose
    pedit cake-tasks
    wincmd p
    silent! exe '0r!cake '.a:task
    norm Gdd
    setlocal ft=coffee
    map <buffer> q :pclose<cr>
    setl buftype=nofile
    setl bufhidden=delete
    setl nobuflisted
endf

func! vim_cake#Cake(bang, ...)
    if a:0 == 0
        call s:CakePreview('')
    else
        exe '!cake '.join(a:000, ' ')
    endif
endf
