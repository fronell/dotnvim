# Linux Setup

Install the appropriate Vim package to get scripting support:

Distro | Package
------ | -------
RHEL   | vim-enhanced
Ubuntu | vim-nox

The steps below delete the existing Vim configuration so be careful!

```bash
cd ~
rm -f ~/.vimrc
rm -rf ~/.vim
git clone https://github.com/fronell/dotvim.git
ln -s ~/dotvim .vim
ln -s ~/dotvim/vimrc ~/.vimrc
# Used by ctags in Vim
touch ~/.vimtags
```

# Windows Setup

The following URL contains a Vim for Windows that is compiled with scripting support and continually updated.  Download and extract to any folder of choice:

https://tuxproject.de/projects/vim/x64/

Check which version of Visual Studio Vim was compiled with because you will need
the C++ redistributables for that version installed for Vim to work.

The steps below delete the existing Vim configuration so be careful!

From a console with Admin rights (Admin is needed to create symlinks):

```
cd %USERPROFILE%
rmdir vimfiles /S /Q
git clone https://github.com/fronell/dotvim.git vimfiles
del _vimrc
mklink _vimrc vimfiles\vimrc
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
