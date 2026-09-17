.PHONY: help submodule-init submodule-update update-rime-ice

help:
	@echo "Available commands:"
	@echo "  make submodule-init    - Initialize and update git submodules"
	@echo "  make submodule-update  - Update git submodules to latest"
	@echo "  make update-rime-ice   - Update rime-ice using plum"

submodule-init:
	@echo "Initializing and updating submodules..."
	git submodule add --force https://github.com/rime/plum.git submodule/plum
	git submodule update --init --recursive

submodule-update:
	@echo "Updating submodules..."
	git submodule update --remote --recursive

update-rime-ice:
	@echo "Updating rime-ice..."
	cd ./submodule/plum && bash rime-install iDvel/rime-ice
	@echo "Done!"
