" vim-search-web.vim - Search keywords in vim from various sources
" Maintainer: Rajasegar Chandran <rajasegar.c@gmail.com>
" Version: 0.0.3


" Mappings
nnoremap <leader>sd :call OpenDuckduckGoSearch(expand('<cword>')) <CR>
nnoremap <leader>sg :call OpenGoogleSearch(expand('<cword>')) <CR>
nnoremap <leader>sgi :call OpenGithubSearch(expand('<cword>')) <CR>
nnoremap <leader>sn :call OpenNpmSearch(expand('<cword>')) <CR>
nnoremap <leader>sr :call OpenRedditSearch(expand('<cword>')) <CR>
nnoremap <leader>ss :call OpenStackOverflowSearch(expand('<cword>')) <CR>
nnoremap <leader>st :call OpenThesaurusSearch(expand('<cword>')) <CR>
nnoremap <leader>sw :call OpenWikipediaSearch(expand('<cword>')) <CR>

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


" Functions
function! OpenDuckduckGoSearch(keyword)
  let url = 'https://duckduckgo.com/?q='.a:keyword
  exec '!'.g:vsw_open_command.' "'.url.'"'
endfunction

function! OpenGoogleSearch(keyword)
  let url = 'https://google.com/search?q='.a:keyword
  exec '!'.g:vsw_open_command.' "'.url.'"'
endfunction

function! OpenGithubSearch(keyword)
  let url = 'https://github.com/search?q='.a:keyword
  exec '!'.g:vsw_open_command.' "'.url.'"'
endfunction

function! OpenStackOverflowSearch(keyword)
  let url = 'https://stackoverflow.com/search?q='.a:keyword
  exec '!'.g:vsw_open_command.' "'.url.'"'
endfunction


function! OpenNpmSearch(keyword)
  let url = 'https://npmjs.com/search?q='.a:keyword
  exec '!'.g:vsw_open_command.' "'.url.'"'
endfunction

function! OpenWikipediaSearch(keyword)
  let url = 'https://wikipedia.com/w/'.a:keyword
  exec '!'.g:vsw_open_command.' "'.url.'"'
endfunction

function! OpenRedditSearch(keyword)
  let url = 'https://www.reddit.com/search/?q='.a:keyword
  exec '!'.g:vsw_open_command.' "'.url.'"'
endfunction

function! OpenThesaurusSearch(keyword)
  let url = 'https://www.thesaurus.com/browse/'.a:keyword
  exec '!'.g:vsw_open_command.' "'.url.'"'
endfunction

" Commands
command! -nargs=1 OpenDuckduckGoSearch call OpenDuckduckGoSearch(<args>)
command! -nargs=1 OpenGoogleSearch call OpenGoogleSearch(<args>)
command! -nargs=1 OpenGithubSearch call OpenGithubSearch(<args>)
command! -nargs=1 OpenStackOverflowSearch call OpenStackOverflowSearch(<args>)
command! -nargs=1 OpenNpmSearch call OpenNpmSearch(<args>)
command! -nargs=1 OpenWikipediaSearch call OpenWikipediaSearch(<args>)
command! -nargs=1 OpenRedditSearch call OpenRedditSearch(<args>)
command! -nargs=1 OpenThesaurusSearch call OpenThesaurusSearch(<args>)
