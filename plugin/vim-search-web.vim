" Mappings
nnoremap <leader>sw :call OpenGoogleSearch(expand('<cword>')) <CR>
nnoremap <leader>sg :call OpenGithubSearch(expand('<cword>')) <CR>

" Functions
function! OpenGoogleSearch(keyword)
  let g:browser = 'google-chrome '
  let url = 'https://google.com/search?q='.a:keyword
  exec '!open "'.url.'"'
endfunction

function! OpenGithubSearch(keyword)
  let g:browser = 'google-chrome '
  let url = 'https://github.com/search?q='.a:keyword
  exec '!open "'.url.'"'
endfunction



