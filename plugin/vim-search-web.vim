" vim-search-web.vim - Search keywords in vim from various sources
" Maintainer: Rajasegar Chandran <rajasegar.c@gmail.com>
" Version: 0.2


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
command! OpenGoogleSearch call OpenGoogleSearch()
command! OpenGithubSearch call OpenGithubSearch()
command! OpenStackOverflowSearch call OpenStackOverflowSearch()
command! OpenNpmSearch call OpenNpmSearch()
