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
the key binding `<Leader>sg`.

That's all, now a separate browser window will open with your search results.


## Key Bindings
- [Leader]sd  => DuckduckGo Search
- [Leader]sg  => Google Search
- [Leader]sgi => Github Search
- [Leader]ss  => StackOverflow Search
- [Leader]sn  => npm Search
- [Leader]sw  => Wikipedia Search
- [Leader]sr  => reddit Search
- [Leader]st  => Thesaurus Search


## Configuration

There are just a few global variables (options) you may set in the *.vimrc* file.

* `g:vsw_open_command`

  Sets the command used to open the URL. In case of Ubuntu this would be
  `"xdg-open"`:

        let g:vsw_open_command = "xdg-open"


## FAQS

### Not able to search keywords with '-' (hyphens)
This plugin is using `CWORD` so spaces and other special characters like hyphens are ignored.
So if you want to include hypens also in your search keywords, just add them(temporarily) to `iskeyword`.

```sh
:set iskeyword+=-
```

## Other Similar plugins
 - https://github.com/szw/vim-g
 - https://github.com/mickaobrien/vim-stackoverflow
