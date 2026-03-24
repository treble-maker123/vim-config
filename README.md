# vim

My own configuration and cheatsheet for vim, feel free to copy and make suggestions.

## Setup

### macOS (automated)

Clone the repo and run:
```sh
make setup-macos
```

### Terraform

[vim-terraform](https://github.com/hashivim/vim-terraform) provides syntax highlighting and indentation for Terraform files. Formatting on save is handled by ALE using `terraform fmt`, which requires the `terraform` CLI to be installed and in your `$PATH`.

To verify:
```sh
which terraform
```

### Theme

I use this in conjunction with [iTerm](https://iterm2.com) and [Visual Studio Code's theme](https://github.com/tallpants/vscode-theme-iterm2)

### coc.nvim

[coc.nvim](https://github.com/neoclide/coc.nvim) provides LSP-based autocompletion and navigation.

### Gutentags

[Gutentags](https://github.com/ludovicchabant/vim-gutentags) is used to generate ctags. Requires `universal-ctags` installed via Homebrew on macOS (handled by `make setup-macos`).

### fzf

[fzf.vim](https://github.com/junegunn/fzf.vim) is used for fuzzy file and content search.

## Cheatsheet

See [CHEATSHEET.md](CHEATSHEET.md) for a full list of commands and keybindings.
