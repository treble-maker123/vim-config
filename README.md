# vim

My own configuration and cheatsheet for vim, feel free to copy and make suggestions.

## Setup

1. Copy the **.vimrc** into your home directory (i.e. ~/) or symlink with `ln -s /path/to/vim-config/.vimrc ~/.vimrc`,
1. Run `vim +PluginInstall +qall` in shell to install all of the plugins with Vundle (see installation notes below),
1. Symlink the language-dependent configurations (e.g. **rb.vim** or **py.vim**) to **~/.vim/ftplugin/LANGUAGE.vim**,
1. (Optional) Reload live vim sessions with the command `:source ~/.vimrc`.

### Vundle Installation

See their [Gihub](https://github.com/VundleVim/Vundle.vim#quick-start) page for information.

### YouCompleteMe

[YouCompleteMe](https://github.com/ycm-core/YouCompleteMe) is a plugin for vim that has support for autocomplete. To enable it, run `cd ~/.vim/bundle/YouCompleteMe && ./install.py --all` to complete setup. See their Github page for more information on setup.

When the autcomplete shows up, use **TAB** key to cycle through suggestions or **shift + TAB** to cycle backwards.

### CtrlP

[CtrlP](https://github.com/ctrlpvim/ctrlp.vim) is a "Full path fuzzy file, buffer, mru, tag, ... finder for Vim".

## Cheatsheet

### Tabs

- :tabnew FILE_NAME - open FILE_NAME in new tab
- :tabmove N - move tab to Nth position, if argument is not provided, moves tab to the last position

### Searching

- Examples searching for files ending in ".erb" for the term "card-panel" - `grep -R --include "*.erb" "card-panel" .`

### NERDTree

[NERDTree](https://github.com/preservim/nerdtree) is a tool for browsing files in a tree similar to those of IDEs.

- <ctrl + n> - toggle NERDTree (a file tree browser), can be changed in the **.vimrc** file
- I (shift + i) - to toggle showing hidden files

## References

These resources below are used as references to customize this **.vimrc**.

1. https://dougblack.io/words/a-good-vimrc.html
1. https://www.jacoballred.com/web-dev/enabling-mouse-support-in-vim/
