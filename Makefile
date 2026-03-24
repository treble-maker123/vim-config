VIM_CONFIG_DIR := $(shell pwd)
FTPLUGIN_DIR   := ~/.vim/after/ftplugin
FTPLUGIN_FILES := py cs html rb typescript typescriptreact sh make terraform

.PHONY: setup-macos update-plugins setup-python

setup-macos:
	@test -f $(VIM_CONFIG_DIR)/.vimrc && test -f $(VIM_CONFIG_DIR)/Makefile || \
		(echo "Error: must be run from the vim-config directory"; exit 1)

	@echo "--- Installing dependencies ---"
	brew install universal-ctags ripgrep

	@echo "--- Symlinking .vimrc ---"
	ln -sf $(VIM_CONFIG_DIR)/.vimrc ~/.vimrc

	@echo "--- Installing vim-plug ---"
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

	@echo "--- Installing vim plugins ---"
	vim +PlugInstall +qall

	@echo "--- Installing coc.nvim extensions ---"
	vim +"CocInstall -sync coc-tsserver coc-pyright coc-json" +qall

	@echo "--- Symlinking ftplugin files ---"
	mkdir -p $(FTPLUGIN_DIR)
	$(foreach f,$(FTPLUGIN_FILES),ln -sf $(VIM_CONFIG_DIR)/$(f).vim $(FTPLUGIN_DIR)/$(f).vim;)

	@echo "--- Done ---"

setup-python:
	@test -f pyproject.toml || (echo "Error: no pyproject.toml found — run this from a Python project root"; exit 1)
	@echo "Current ruff version (if installed):"
	@.venv/bin/ruff --version 2>/dev/null || echo "  ruff not found in .venv"
	@echo ""
	@echo "To pin ruff, run:"
	@echo "  uv add --dev ruff==<version>"
	@echo ""
	@echo "Then update .vimrc to use the project-local ruff:"
	@echo "  let g:ale_python_ruff_executable = '.venv/bin/ruff'"
	@echo ""
	@echo "Available ruff versions: https://github.com/astral-sh/ruff/releases"
	@echo ""
	@echo "--- Autocomplete (coc-pyright) ---"
	@echo "To enable Python autocomplete, create a pyrightconfig.json in the project root:"
	@echo '  { "venvPath": ".", "venv": ".venv" }'
	@echo ""
	@echo "Or set globally in Vim with :CocConfig:"
	@echo '  { "python.pythonPath": ".venv/bin/python" }'

update-plugins:
	@echo "--- Updating vim plugins ---"
	vim +PlugUpdate +qall
	@echo "--- Updating coc.nvim extensions ---"
	vim +"CocUpdate" +qall
	@echo "--- Done ---"
