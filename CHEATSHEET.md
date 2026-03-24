# Vim Cheatsheet

To check what a key is currently mapped to, use `nmap`.

## Search Keyword

-   `grep -rnw './parent_path' -e 'keywords'`

## Open File

-   In current pane, use `:e FILE_NAME`

## NERDTree

[NERDTree](https://github.com/preservim/nerdtree) is a tool for browsing files in a tree similar to those of IDEs.

-   `ctrl + n` - toggle NERDTree
-   `\m` - show git blame popup for current line
-   `\n` - reveal and highlight the current file in NERDTree (press `\` then `n` in normal mode)
-   `I` (shift + i) - toggle showing hidden files
-   `o` / `Enter` - open/expand a file or directory
-   `s` - open file in vertical split
-   `i` - open file in horizontal split
-   `C` - change tree root to selected directory
-   `r` - refresh current directory
-   `R` - refresh tree root

## Copy, Cutting, & Pasting

-   To select, `v` to select characters, `V` to select whole lines, or use the mouse to highlight when mouse mode is enabled,
-   To copy, `y` for "yank",
-   To cut, `d`,
-   To paste before cursor press `P`. to paste after cursor press `p`.

Alternatively, in visual mode `CTRL-c` copies and `CTRL-x` cuts.

## Folding

-   `zc` closes a fold
-   `zo` opens a fold

## Saving

-   `:w` writes the current changes to disk,
-   `CTRL-\` is a shortcut that writes changes to disk and returns to normal mode.

## Undo & Redo

In normal mode:

-   `:u` or simply press `u` will undo a previous change
-   `ctrl + r` will redo the previously undone change

## Tabs

-   `:tabnew FILE_NAME` - open FILE_NAME in new tab
-   `:tabmove N` - move tab to Nth position, if argument is not provided, moves tab to the last position

## Panes

-   `vs filename` - open in new vertical split
-   `sp filename` - open in new horizontal split

Resizing:

-   `resize +5` to increase the height of the pane
-   `vertical resize +5` to increase the width of the pane

Alternatively, `ctrl-w +` and `ctrl-w -` to resize the height of the current window, `ctrl+w >` and `ctrl+w <` to resize the width of the current window. To resize all windows, `ctrl-w =`.

## Commenting/Uncommenting

-   `\ c <SPACE>` toggles commenting/uncommenting of lines.

## Searching

-   Enter the command `:/` (forward) or `:?` (backward), type in the search query, then hit `Enter` to search.
-   `n` - next match forward, `N` - next match backward
-   `:noh` clears the highlighted search terms
-   `grep -R --include "*.erb" "card-panel" .` - search file contents by extension from the shell

## coc.nvim

-   `:CocRestart` - restart the language server (e.g. after installing a new package)

-   `TAB` / `shift+TAB` - cycle through completion suggestions
-   `gd` - go to definition / follow symbol
-   `gy` - go to type definition
-   `gi` - go to implementation
-   `gr` - show references
-   `K` - show documentation

## fzf

-   `ctrl+p` - fuzzy file search
-   `\f` - search file contents with ripgrep
