# My Vim/NeoVim Config (WIP, only Golang/Javascript(JSX) now)

## Plugin Management

### NeoVim Plugin Location on Mac

`~/.local/share/nvim/plugged`

### Plugin Manager

Use [Vim-Plug](https://github.com/junegunn/vim-plug) as plugin manager. Install Vim-Plug first following instructions by the author of Vim-Plug.

Copy the config into your `.vimrc` or `init.vim` (I didn't test this with Vim but most of the settings should be the same). Save it and reopen a vim instance (or :so %) to run `:PlugInstall` or `<leader>pi` to install all plugins.

To remove useless plugins, run `:PlugClean` pr `<leader>pi`.

## Autocomplete

### Plugin

After a long time usage of [YouCompleteMe](https://github.com/Valloric/YouCompleteMe), I switched to [coc.nvim](https://github.com/neoclide/coc.nvim). With the great async feature of neovim, it works like charm especially when most mainstream languages have great [language server protocol](https://microsoft.github.io/language-server-protocol/) supports(__Thank you Microsoft, sincerely__).

### Language support 

#### Golang 

You might need to install additional go packages to use full feature of [vim-go](https://github.com/fatih/vim-go). Please refer to the instructions. I use this simply as an addition to `coc.nvim`.

A few useful shortcuts I use every day:

```
* <F12>: Go to definition

* >>/<<: Go to next function

* :GoImports: make import a bit more straightforward
```

#### JavaScript/JSX(React)

In my work we use two spaces as indentation, so feel free to change it if you prefer other indentation.

Not all plugins I installed are required for JS development but I found it works for me.

Sometimes syntax highlighting has issues with complicated string templates.

#### Python

Still work in progress but it feels ok.

#### CoffeeScript

Syntax highlighting and simple lint works.

## General Settings

### Leader Key

I use `<space>` as leader key. The easy position makes it easy and encourages me to use it more.

### <Esc>

I map `jj` as `<esc>`. Not only because of the stupid touchbar (Apple gave it back now), but make normal mode more accessible for me, which I think is a good practice for every vimmer.

### Fuzzy search

I use `fzf` as native app and install the `fzf-vim` plugin wrapping it by vim. Also I installed `bat` to provide file preview with syntax highlighting.

Functions:

```
1. <ctrl>-p: project file fuzzy search

2. <ctrl>-e: buffer file fuzzy search

3. <leader>f: text fuzzy search (worked with [ripgrep](https://github.com/BurntSushi/ripgrep))

```

### Git

I'm used to work with git in commandline. But I found it handy to access some git info/actions within the editor.

```
1. :Gdiff - diff the current file (fugitive)

2. :Gstatus - extended interactive ui of git status (fugitive)

3. <leader>gm - show git message of the current line (git-messenger)

4. >>/<< - next/previous git hunk (fugitive)
```

the status in gutter is provided by `vim-gitgutter`.

## License
MIT
