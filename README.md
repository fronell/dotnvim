# Windows Setup

Download the latest stable version of Neovim from:

https://github.com/neovim/neovim/releases/tag/stable

The steps below delete the existing Vim configuration so be careful!

From a console with Admin rights (Admin is needed to create symlinks):

```
cd %USERPROFILE%\AppData\Local
rmdir nvim /S /Q
git clone https://github.com/fronell/dotnvim.git nvim
```

## pt

This Vim setup uses The Platinum Searcher (pt) binary for searching through files in place of ack/ag/grep/etc...

Required by the plugin [pt.vim](https://github.com/nazo/pt.vim)

Setup instructions:

1. Download pt for Windows from https://github.com/monochromegane/the_platinum_searcher/releases
2. Place pt.exe in a directory thats in %PATH%

## ctags

Used to generate an index of source code files that can be used to navigate between different points of interest.

Required by the following plugins:

* [Ctrl-P](https://github.com/ctrlpvim/ctrlp.vim)
* [Tagbar](https://github.com/majutsushi/tagbar.git)

Setup instructions:

1. Download ctags for Windows from https://github.com/universal-ctags/ctags-win32/releases
2. Place ctags.exe in a directory thats in %PATH%
