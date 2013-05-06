command! -bang -nargs=* -complete=customlist,vim_cake#CakeComplete Cake call vim_cake#Cake("<bang>", <f-args>)
cabbrev cake <c-r>=(getcmdtype()==':' && getcmdpos()==1 ? 'Cake' : 'cake')<CR>
