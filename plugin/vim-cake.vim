command! -bang -nargs=* -complete=customlist,cake#Complete Cake call cake#Task("<bang>", <f-args>)
cabbrev cake <c-r>=(getcmdtype()==':' && getcmdpos()==1 ? 'Cake' : 'cake')<CR>
