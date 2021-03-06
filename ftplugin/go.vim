" Go specific key bindings
"------------------------

set autowrite

au FileType go set noexpandtab
au FileType go set shiftwidth=4
au FileType go set softtabstop=4
au FileType go set tabstop=4

" run :GoBuild or :GoTestCompile based on the go file
"function! s:build_go_files()
"  let l:file = expand('%')
"  if l:file =~# '^\f\+_test\.go$'
"    call go#cmd#Test(0, 1)
"  elseif l:file =~# '^\f\+\.go$'
"    call go#cmd#Build(0)
"  endif
"endfunction

" Go related mappings
:nmap <Leader>i :GoInfo<CR>
:nmap <Leader>gd :GoDef<CR>
:nmap <Leader>r <Plug>(go-run)
:nmap <Leader>re :GoRename<CR>
:nmap <Leader>t :GoTest<CR>
:nmap <Leader>tf :GoTest<CR>
:nmap <Leader>b :GoBuild<CR>
:nmap <Leader>gc :GoCoverageToggle<CR>
:nmap gd <Plug>(go-def-tab)

au Filetype go nmap <leader>ga <Plug>(go-alternate-edit)
au Filetype go nmap <leader>gah <Plug>(go-alternate-split)
au Filetype go nmap <leader>gav <Plug>(go-alternate-vertical)
au FileType go nmap <leader>gt :GoDeclsDir<cr>



" (un)comment line(s)
:map <buffer> <Leader>// :s:^://:<CR>:noh<CR>
:map <buffer> <Leader>?? :s:^\s*//::<CR>:noh<CR>
