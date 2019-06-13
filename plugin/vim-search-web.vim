" vim-search-web.vim - Search keywords in vim from various sources
" Maintainer: Rajasegar Chandran <rajasegar.c@gmail.com>
" Version: 0.3


" Mappings
nnoremap <leader>sw :call OpenGoogleSearch(expand('<cword>')) <CR>
nnoremap <leader>sg :call OpenGithubSearch(expand('<cword>')) <CR>
nnoremap <leader>ss :call OpenStackOverflowSearch(expand('<cword>')) <CR>
nnoremap <leader>sn :call OpenNpmSearch(expand('<cword>')) <CR>

let g:browser = 'google-chrome '

" Functions
function! OpenGoogleSearch(keyword)
  let url = 'https://google.com/search?q='.a:keyword
  exec '!open "'.url.'"'
endfunction

function! OpenGithubSearch(keyword)
  let url = 'https://github.com/search?q='.a:keyword
  exec '!open "'.url.'"'
endfunction

function! OpenStackOverflowSearch(keyword)
  let url = 'https://stackoverflow.com/search?q='.a:keyword
  exec '!open "'.url.'"'
endfunction


function! OpenNpmSearch(keyword)
  let url = 'https://npmjs.com/search?q='.a:keyword
  exec '!open "'.url.'"'
endfunction

" Commands
command! -nargs=1 OpenGoogleSearch call OpenGoogleSearch(<args>)
command! -nargs=1 OpenGithubSearch call OpenGithubSearch(<args>)
command! -nargs=1 OpenStackOverflowSearch call OpenStackOverflowSearch(<args>)
command! -nargs=1 OpenNpmSearch call OpenNpmSearch(<args>)
