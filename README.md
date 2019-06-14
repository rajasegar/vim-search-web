# vim-search-web

Search the web from your Vim editor

## Install

Place in `~/.vim/plugin/vim-search-web.vim`

### For Pathogen

```sh
cd ~/.vim/bundle
git clone https://github.com/rajasegar/vim-search-web.git
```

### With Vundle
Add this to your plugins list in  `.vimrc`

```sh
Plugin 'rajasegar/vim-search-web'
```


## Usage
Just place the cursor on any word about which you want to search and use
the key binding `<Leader>sw`.

That's all, now a separate browser window will open with your search results.


## Key Bindings
- [Leader]sw => Google Search
- [Leader]sg => Github Search
- [Leader]ss => StackOverflow Search
- [Leader]sn => npm Search

## FAQS

### Not able to search keywords with '-' (hyphens)
This plugin is using `CWORD` so spaces and other special characters like hyphens are ignored.
So if you want to include hypens also in your search keywords, just add them(temporarily) to `iskeyword`.

```sh
:set iskeyword+=-
```

## Upcoming sources
- Wikipedia
- Thesaurus

## Other Similar plugins
 - https://github.com/szw/vim-g
 - https://github.com/mickaobrien/vim-stackoverflow
