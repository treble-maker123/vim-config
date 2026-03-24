VIM_CONFIG_DIR := $(shell pwd)
FTPLUGIN_DIR   := ~/.vim/after/ftplugin
FTPLUGIN_FILES := py cs html rb typescript typescriptreact sh make terraform

.PHONY: setup-macos update-plugins

setup-macos:
	@test -f $(VIM_CONFIG_DIR)/.vimrc && test -f $(VIM_CONFIG_DIR)/Makefile || \
		(echo "Error: must be run from the vim-config directory"; exit 1)

	@echo "--- Installing universal-ctags ---"
	brew install universal-ctags

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

update-plugins:
	@echo "--- Updating vim plugins ---"
	vim +PlugUpdate +qall
	@echo "--- Updating coc.nvim extensions ---"
	vim +"CocUpdate" +qall
	@echo "--- Done ---"
