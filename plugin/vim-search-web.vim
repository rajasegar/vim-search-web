" vim-search-web.vim - Search keywords in vim from various sources
" Maintainer: Rajasegar Chandran <rajasegar.c@gmail.com>
" Version: 0.0.3


" Mappings
nnoremap <leader>sd     :call OpenSearch("duckduckgo",expand('<cword>')) <CR>
nnoremap <leader>sg     :call OpenSearch("google",expand('<cword>')) <CR>
nnoremap <leader>sgi    :call OpenSearch("github",expand('<cword>')) <CR>
nnoremap <leader>sn     :call OpenSearch("npm",expand('<cword>')) <CR>
nnoremap <leader>sr     :call OpenSearch("reddit",expand('<cword>')) <CR>
nnoremap <leader>ss     :call OpenSearch("stackoverflow",expand('<cword>')) <CR>
nnoremap <leader>st     :call OpenSearch("thesaurus",expand('<cword>')) <CR>
nnoremap <leader>sld    :call OpenSearch("dictionary",expand('<cword>')) <CR>
nnoremap <leader>sw     :call OpenSearch("wikipedia",expand('<cword>')) <CR>

let s:engines = {
 \ 'duckduckgo': 'https://duckduckgo.com/?q=',
 \ "google":'https://google.com/search?q=',
 \ "github":'https://github.com/search?q=',
 \ "stackoverflow":'https://stackoverflow.com/search?q=',
 \ "npm":'https://npmjs.com/search?q=',
 \ "wikipedia":'http://wikipedia.com/w/',
 \ "reddit":'https://www.reddit.com/search/?q=',
 \ "thesaurus":'https://www.thesaurus.com/browse/',
 \ "dictionary":'http://www.learnersdictionary.com/definition/',
 \ }

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
command! -nargs=1 OpenDuckduckGoSearch      call OpenSearch("duckduckgo",<args>)
command! -nargs=1 OpenGoogleSearch          call OpenSearch("google",<args>)
command! -nargs=1 OpenGithubSearch          call OpenSearch("github",<args>)
command! -nargs=1 OpenStackOverflowSearch   call OpenSearch("stackoverflow",<args>)
command! -nargs=1 OpenNpmSearch             call OpenSearch("npm",<args>)
command! -nargs=1 OpenWikipediaSearch       call OpenSearch("wikipedia",<args>)
command! -nargs=1 OpenRedditSearch          call OpenSearch("reddit",<args>)
command! -nargs=1 OpenThesaurusSearch       call OpenSearch("thesaurus",<args>)
command! -nargs=1 OpenDictioraySearch       call OpenSearch("dictionary",<args>)
