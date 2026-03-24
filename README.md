# vim

My own configuration and cheatsheet for vim, feel free to copy and make suggestions.

## Setup

### macOS (automated)

Clone the repo and run:
```sh
make setup-macos
```

### Manual setup

1.  Copy the **.vimrc** into your home directory (i.e. ~/) or symlink with `ln -s /path/to/vim-config/.vimrc ~/.vimrc`,
2.  Install [vim-plug](https://github.com/junegunn/vim-plug):
    ```sh
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    ```
3.  Run `vim +PlugInstall +qall` in shell, or `:PlugInstall` in vim, to install all plugins,
4.  Install [coc.nvim](https://github.com/neoclide/coc.nvim) language extensions — open vim and run:
    ```
    :CocInstall coc-tsserver coc-pyright coc-json
    ```
5.  Symlink the language-dependent configurations to `~/.vim/after/ftplugin/`:
    ```sh
    mkdir -p ~/.vim/after/ftplugin
    for f in py cs html rb typescript typescriptreact sh make terraform; do
      ln -s /path/to/vim-config/$f.vim ~/.vim/after/ftplugin/$f.vim
    done
    ```
6.  (Optional) Reload live vim sessions with the command `:source ~/.vimrc`.

### Terraform

[vim-terraform](https://github.com/hashivim/vim-terraform) provides syntax highlighting and indentation for Terraform files. Formatting on save is handled by ALE using `terraform fmt`, which requires the `terraform` CLI to be installed and in your `$PATH`.

To verify:
```sh
which terraform
```

### Theme

I use this in conjunction with [iTerm](https://iterm2.com) and [Visual Studio Code's theme](https://github.com/tallpants/vscode-theme-iterm2)

### coc.nvim

[coc.nvim](https://github.com/neoclide/coc.nvim) provides LSP-based autocompletion and navigation. Key bindings:

-   `TAB` / `shift+TAB` - cycle through completion suggestions
-   `gd` - go to definition
-   `gy` - go to type definition
-   `gi` - go to implementation
-   `gr` - show references
-   `K` - show documentation

### Gutentags

[Gutentags](https://github.com/ludovicchabant/vim-gutentags) is used to generate ctags. In order for the plugin to run, must install `ctag` on your machine (i.e. `sudo apt install exuberant-ctags`).

### fzf

[fzf.vim](https://github.com/junegunn/fzf.vim) is used for fuzzy file and content search:

-   `ctrl+p` - fuzzy file search
-   `\f` - search file contents with ripgrep

## Cheatsheet

To check what a key is current mapped, use `nmap`.

### Search Keyword

-   `grep -rnw './parent_path' -e 'keywords'`

### Open File

-   In current pane, use `:e FILE_NAME`

### NERDTree

  [NERDTree](https://github.com/preservim/nerdtree) is a tool for browsing files in a tree similar to those of IDEs.

-   `ctrl + n` - toggle NERDTree (a file tree browser), can be changed in the **.vimrc** file
-   I (shift + i) - to toggle showing hidden files

### Copy, Cutting, & Pasting

-   To select, `v` to select characters, `V` to select whole lines, or use the mouse to highlight when mouse mode is enabled,
-   To copy, `y` for "yank",
-   To cut, `d`,
-   To paste before cursor press `P`. to paste after cursor press `p`.

Alternatively, in visual mode `CTRL-c` copies and `CTRL-x` cuts.

MacVim on MacOS and vim-gtk (should uninstall vim and install vim-gtk) should allow yank and cut to copy to system clipboard.

### Folding

-   `zc` closes a fold
-   `zo` opens a fold

### Saving

-   `:w` writes the current changes to disk,
-   `<CTRL> z` is a shortcut that writes changes to disk and changes back to normal mode.

### Undo & Redo

  In normal mode:

-   `:u` or simply press `u` will undo a previous change
-   `ctrl + r` will redo the previously undone change

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

### Commenting/Uncommenting

-   `\ c <SPACE>` toggles commenting/uncomment of lines.

### Searching

-   Enter the command `:/` (forward) or `:?` (backward), type in the search query, then hit <ENTER> to search. Hit <n> to search for the next forward instance, and <N> to search for the next backward instance
-   `:noh` clears the highlighted search terms
-   (Not specific to VIM, but helpful) Examples searching for files ending in ".erb" for the term "card-panel" - `grep -R --include "*.erb" "card-panel" .`

## References

  These resources below are used as references to customize this **.vimrc**.

1.  <https://dougblack.io/words/a-good-vimrc.html>
2.  <https://www.jacoballred.com/web-dev/enabling-mouse-support-in-vim/>
