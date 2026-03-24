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

## Python Formatting

ALE formats Python files on save using `ruff`. The `.vimrc` points to a global ruff at `/Users/zguan/Projects/.venv/bin/ruff`, but for per-project formatting it's better to pin ruff in each project and point ALE to the local venv instead.

### Pinning ruff per project

In your `pyproject.toml`:
```toml
[dependency-groups]
dev = [
    "ruff==0.x.y",
]
```

Or with uv:
```sh
uv add --dev ruff==0.x.y
```

Then update `.vimrc` to use the project-local ruff:
```vim
let g:ale_python_ruff_executable = '.venv/bin/ruff'
```

Run `make setup-python` from any Python project to be guided through this.

### Autocomplete

`coc-pyright` provides Python autocomplete but needs to know which virtualenv to use. Create a `pyrightconfig.json` in the project root:

```json
{
  "venvPath": ".",
  "venv": ".venv"
}
```

Or set it globally via `:CocConfig` in Vim:

```json
{
  "python.pythonPath": ".venv/bin/python"
}
```

## Cheatsheet

See [CHEATSHEET.md](CHEATSHEET.md) for a full list of commands and keybindings.
