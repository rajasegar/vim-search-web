" vim-search-web.vim - Search keywords in vim from various sources
" Maintainer: Rajasegar Chandran <rajasegar.c@gmail.com>
" Version: 0.0.3

" add new engines here to automatically generate a command and a keymap
" :call Open{Engine}Search 
" <leader>s{FirstLetterOfEngine}
let s:engines = {
 \ 'Duckduckgo':    'https://duckduckgo.com/?q=',
 \ "Google":        'https://google.com/search?q=',
 \ "Github":        'https://github.com/search?q=',
 \ "Stackoverflow": 'https://stackoverflow.com/search?q=',
 \ "Npm":           'https://npmjs.com/search?q=',
 \ "Wikipedia":     'http://wikipedia.com/w/',
 \ "Reddit":        'https://www.reddit.com/search/?q=',
 \ "Thesaurus":     'https://www.thesaurus.com/browse/',
 \ "Dictionary":    'http://www.learnersdictionary.com/definition/',
 \ }


" Mappings
" single letter mappings - automatic, dont touch
for engine in keys(s:engines)
    execute "nnoremap <leader>s".tolower(engine[0:0])." :call OpenSearch('".engine."',expand('<cword>')) <CR>"
endfor
" double letter mappings (for 2 searches that start with the same letter)
nnoremap <leader>sgi    :call OpenSearch("Github",expand('<cword>')) <CR>
nnoremap <leader>sld    :call OpenSearch("Dictionary",expand('<cword>')) <CR>

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
function! OpenSearch(engine, keyword)
    if has_key(s:engines, a:engine)
        let url = s:engines[a:engine] . a:keyword
        exec '!'.g:vsw_open_command.' "'.url.'"'
    endif
endfunction

" Commands
for engine in keys(s:engines)
    execute "command! -nargs=1 Open".engine."Search call OpenSearch('".engine."',<args>)"
endfor
