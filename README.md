# vim

My own configuration and cheatsheet for vim, feel free to copy and make suggestions.

## Setup

1.  Copy the **.vimrc** into your home directory (i.e. ~/) or symlink with `ln -s /path/to/vim-config/.vimrc ~/.vimrc`,
2.  Run `vim +PluginInstall +qall` in shell to install all of the plugins with Vundle (see installation notes below for installing vundle), 
3.  Symlink the language-dependent configurations (e.g. **rb.vim** or **py.vim**) to **~/.vim/ftplugin/LANGUAGE.vim**,
4.  (Optional) Reload live vim sessions with the command `:source ~/.vimrc`.

### Vundle Installation

  See their [Gihub](https://github.com/VundleVim/Vundle.vim#quick-start) page for information.

### YouCompleteMe

  [YouCompleteMe](https://github.com/ycm-core/YouCompleteMe) is a plugin for vim that has support for autocomplete. To enable it, run `cd ~/.vim/bundle/YouCompleteMe && ./install.py --all` to complete setup. See their Github page for more information on setup.

  When the autcomplete shows up, use **TAB** key to cycle through suggestions or **shift + TAB** to cycle backwards.

### CtrlP

  [CtrlP](https://github.com/ctrlpvim/ctrlp.vim) is a "Full path fuzzy file, buffer, mru, tag, ... finder for Vim".

## Cheatsheet

### NERDTree

  [NERDTree](https://github.com/preservim/nerdtree) is a tool for browsing files in a tree similar to those of IDEs.

-   &lt;ctrl + n> - toggle NERDTree (a file tree browser), can be changed in the **.vimrc** file
-   I (shift + i) - to toggle showing hidden files

### Copy, Cutting, & Pasting

-   To copy, `v` to select characters, `V` to select whole lines, or use the mouse to highlight when mouse mode is enabled,
-   To cut, `d`,
-   To paste before cursor press `P`. to paste after cursor press `p`.

### Undo & Redo

  In normal mode:

-   `:u` will undo a previous change
-   &lt;ctrl + r> will redo the previously undone change

### Tabs

-   `:tabnew FILE_NAME` - open FILE_NAME in new tab
-   `:tabmove N` - move tab to Nth position, if argument is not provided, moves tab to the last position

### Panes

-   `vs filename` - open in new vertical split
-   `sp filename` - open in new horizontal split

Resizing:

-   `resize +5` to increase the height of the pane
-   `vertical resize +5` to increase the width of the pane

Alternatively, `ctrl-w +` and `ctrl-w -` to resize the height of the current window, `ctrl+w >` and `ctrl+w <` to resize the width of the current window. To resize all windows, `ctrl-w =`.

### Searching

-   Enter the command `:/` (forward) or `:?` (backward), type in the search query, then hit <ENTER> to search. Hit <n> to search for the next forward instance, and <N> to search for the next backward instance
-   `:noh` clears the highlighted search terms
-   (Not specific to VIM, but helpful) Examples searching for files ending in ".erb" for the term "card-panel" - `grep -R --include "*.erb" "card-panel" .`

## References

  These resources below are used as references to customize this **.vimrc**.

1.  <https://dougblack.io/words/a-good-vimrc.html>
2.  <https://www.jacoballred.com/web-dev/enabling-mouse-support-in-vim/>
