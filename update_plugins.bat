setlocal

set TEMPDIR=temp
set BUNDLEDIR=bundle
set FTPLUGINDIR=ftplugin
set VIMEXE=c:\cloud\apps\nvim\bin\nvim.exe

:: We use a temp dir so we can exclude .git and .gitignore files when we
:: copy the clone --depth 1s to the bundle dir
rmdir /Q /S %TEMPDIR%
mkdir %TEMPDIR%

:: [==== ANSIBLE ====]
:: Ansible YAML: Ansible syntax checker that supports ansible-lint
:: git clone --depth 1 https://github.com/chase/vim-ansible-yaml.git %TEMPDIR%\ansible-yaml
:: Modify the filetype detection in the plugin so its used for all yaml files
:: sed -i "s/if fp.*/if fp =~ '.*\\\.y\\\(a\\\)\\\?ml$'/" %TEMPDIR%\ansible-yaml\ftdetect\ansible.vim
:: Will limit loading of ft=ansible only for yaml files under ansible/*
:: sed -i "s/if fp.*/if fp =~ 'ansible\/.*\\\.y\\\(a\\\)\\\?ml$'/" bundle\ansible-yaml\ftdetect\ansible.vim
:: "if fp =~ '/ansible/.*\.y\(a\)\?ml$' || fp =~ '/\(group\|host\)_vars/'

:: [==== COLORS ====]
:: Base16 Vim: An architecture for building themes using a base of sixteen colors
git clone --depth 1 https://github.com/chriskempson/base16-vim.git %TEMPDIR%\base16
:: code-dark: Dark color scheme for Vim heavily inspired by the look of the Dark+ scheme of Visual Studio Code
git clone --depth 1 https://github.com/tomasiser/vim-code-dark.git %TEMPDIR%\codedark
:: gotham: Gotham is a very dark vim colorscheme
git clone --depth 1 https://github.com/whatyouhide/vim-gotham %TEMPDIR%\gotham

:: [==== FORMATTING ====]
:: Tabular: Makes aligning text fun!
git clone --depth 1 https://github.com/godlygeek/tabular.git %TEMPDIR%\tabular

:: [==== GENERAL ====]
:: AutoComplPop: Fork that does not automatically select first item in popup menu
:: More here: https://bitbucket.org/ns9tks/vim-autocomplpop/issue/53/make-autoselection-of-the-first-item
git clone --depth 1 https://github.com/dirkwallenstein/vim-autocomplpop %TEMPDIR%\autocomplpop
:: Bbye: Deleting a buffer without closing the window
git clone --depth 1 https://github.com/moll/vim-bbye.git %TEMPDIR%\bbye
:: L9: Dependency for autocomplpop
git clone --depth 1 https://github.com/vim-scripts/L9.git %TEMPDIR%\L9
:: Markdown: Syntax highlighting, matching rules and mappings for the original Markdown and extensions
git clone --depth 1 https://github.com/preservim/vim-markdown.git %TEMPDIR%\markdown

:: [==== GENERAL CODING ====]
:: ALE (Asynchronous Lint Engine): Plugin providing linting (syntax checking and semantic errors)
git clone --depth 1 https://github.com/dense-analysis/ale.git %TEMPDIR%/ale
:: Better Whitespace: Highlights trailing whitespace and can remove them all
git clone --depth 1 https://github.com/ntpeters/vim-better-whitespace.git %TEMPDIR%\better-whitespace
:: Commentary: Toggle commenting lines in multiple languages
git clone --depth 1 https://github.com/tpope/vim-commentary %TEMPDIR%\commentary
:: Endwise: Automatically closes programming structures like adding an end to Ruby blocks
git clone --depth 1 https://github.com/tpope/vim-endwise.git %TEMPDIR%\endwise
:: Repeat: Required to repeat actions with '.' in surround and commentary plugins
git clone --depth 1 https://github.com/tpope/vim-repeat.git %TEMPDIR%\repeat
:: Space Jam: This plugin automatically removes trailing whitespace for ruby, python, javascript, et al
:: It provides automated removal of whitespace while "Better Whitespace" provides highlighting
git clone --depth 1 https://github.com/rondale-sc/vim-spacejam.git %TEMPDIR%\spacejam
:: Surround: Makes handling surrounding structures like '' () [] fun!
git clone --depth 1 https://github.com/tpope/vim-surround.git %TEMPDIR%\surround
:: Tagbar: Displays tags ordered by scope
git clone --depth 1 https://github.com/majutsushi/tagbar.git %TEMPDIR%\tagbar
:: Togglelist: Allows for a binding to toggle the quicklist and locationlist
git clone --depth 1 https://github.com/milkypostman/vim-togglelist.git %TEMPDIR%\togglelist

:: [==== GIT ====]
:: Fugitive: Git management in Vim
git clone --depth 1 https://github.com/tpope/vim-fugitive.git %TEMPDIR%\fugitive
:: gitgutter: Shows a git diff in the sign column
:: git clone --depth 1 https://github.com/airblade/vim-gitgutter.git %TEMPDIR%\gitgutter
:: gitv: Provides a commit browser for the repo or a specific file
:: git clone --depth 1 https://github.com/gregsexton/gitv.git %TEMPDIR%\gitv

:: [==== PYTHON ====]
:: jedi-vim: awesome Python autocompletion with VIM
:: git clone --depth 1 --recursive https://github.com/davidhalter/jedi-vim.git %TEMPDIR%\jedi-vim
:: cd %TEMPDIR%\jedi-vim
:: git submodule update --init
:: cd ..\..\
:: Python-mode: Can conflict with jedi-vim according to https://github.com/davidhalter/jedi-vim/issues/163
:: git clone --depth 1 https://github.com/python-mode/python-mode %TEMPDIR%\python-mode

:: [==== SEARCH ====]
:: ctrlsf: An ack/ag/pt powered search and view tool
git clone --depth 1 https://github.com/dyng/ctrlsf.vim.git %TEMPDIR%\ctrlsf
:: Ctrl-P: Fuzzy finder for files/tags/buffers
git clone --depth 1 https://github.com/ctrlpvim/ctrlp.vim %TEMPDIR%\ctrlp
:: The Platinum Searcher: Vim interface for pt
git clone --depth 1 https://github.com/nazo/pt.vim.git %TEMPDIR%\pt

:: [==== SHELL/TERMINAL ====]
:: Deol: A dark powered shell for Neovim & Vim
:: git clone --depth 1 https://github.com/Shougo/deol.nvim.git %TEMPDIR%\deol
:: Dispatch: Leverage the power of Vim's compiler plugins without being bound by synchronicity
:: git clone --depth 1 https://github.com/tpope/vim-dispatch.git %TEMPDIR%\dispatch

:: Rebuild the bundle directory
rmdir /q /s %BUNDLEDIR%
mkdir %BUNDLEDIR%
robocopy temp\ bundle\ /mir /xd .git .github /xf .gitignore
rmdir /q /s %TEMPDIR%

:: Rebuild ftplugin for plugins that don't come in bundle form
:: rmdir /q /s %FTPLUGINDIR%
:: mkdir %FTPLUGINDIR%
:: cd %FTPLUGINDIR%
:: curl https://raw.githubusercontent.com/fronell/dotvim/master/ftplugin/python_fn.vim > python_vn.vim
:: cd ..

:: Generate Help Tags for new plugins or updated docs in existing plugins
%VIMEXE% -c Helptags -c q

:: Will manually add changes for now
:: git add .
