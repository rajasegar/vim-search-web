" vim-search-web.vim - Search keywords in vim from various sources
" Maintainer: Rajasegar Chandran <rajasegar.c@gmail.com>
" Version: 0.3


" Mappings
nnoremap <leader>sw :call OpenGoogleSearch(expand('<cword>')) <CR>
nnoremap <leader>sg :call OpenGithubSearch(expand('<cword>')) <CR>
nnoremap <leader>ss :call OpenStackOverflowSearch(expand('<cword>')) <CR>
nnoremap <leader>sn :call OpenNpmSearch(expand('<cword>')) <CR>

if exists("g:loaded_vim_search_web") || &cp || v:version < 700
  finish
endif

let g:loaded_vim_search_web = 1

" Taken from szw/vim-g
" to support other platforms like Linux and Windows
if !exists("g:vsw_open_command")
  if has("win32")
    let g:vsw_open_command = "start"
  elseif substitute(system('uname'), "\n", "", "") == 'Darwin'
    let g:vsw_open_command = "open"
  else
    let g:vsw_open_command = "xdg-open"
  endif
endif

let g:browser = 'google-chrome '

" Functions
function! OpenGoogleSearch(keyword)
  let url = 'https://google.com/search?q='.a:keyword
  "exec '!open "'.url.'"'
  exec '!'.g:vsw_open_command.' "'.url.'"'
endfunction

function! OpenGithubSearch(keyword)
  let url = 'https://github.com/search?q='.a:keyword
  "exec '!open "'.url.'"'
  exec '!'.g:vsw_open_command.' "'.url.'"'
endfunction

function! OpenStackOverflowSearch(keyword)
  let url = 'https://stackoverflow.com/search?q='.a:keyword
  "exec '!open "'.url.'"'
  exec '!'.g:vsw_open_command.' "'.url.'"'
endfunction


function! OpenNpmSearch(keyword)
  let url = 'https://npmjs.com/search?q='.a:keyword
  "exec '!open "'.url.'"'
  exec '!'.g:vsw_open_command.' "'.url.'"'
endfunction

" Commands
command! -nargs=1 OpenGoogleSearch call OpenGoogleSearch(<args>)
command! -nargs=1 OpenGithubSearch call OpenGithubSearch(<args>)
command! -nargs=1 OpenStackOverflowSearch call OpenStackOverflowSearch(<args>)
command! -nargs=1 OpenNpmSearch call OpenNpmSearch(<args>)
