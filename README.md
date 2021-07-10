# Simple LUA Neovim
WIP! Always WIP!

Concepts: 
- Minimal neovim config based around the new LUA integration
- Reduced [inter]dependencies: be able to really get work done without getting bogged under with broken plugins or other gotchas
- Be cross-platform and integrate with VS-Code (for work/fallback)

How:
- Keeping configuration files and plugins as independent as possible (not sure how this will play out for people wanting to use this as a distro, I'm sure there is a way using the power of LUA)
- Less directories, files, sources and requires
- As few plugins as possible, leveraging built-ins

# Set up
1. Move your old config out (both nvim and nvim-data), on linux: `mv ~/.config/nvim ~/.config/nvim_old; mv ~/.local/share/nvim ~/.local/share/nvim_old`
1. Clone the repo with: `git clone git@github.com:account-sxf/simple-lua-neovim.git ~/.config/nvim`
1. Run PackerSync
1. Restart neovim

# What's working
credit to the genius creators of these plugins and their dependencies:
- Package Management: wbthomason/packer.nvim
- Auto-complete: hrsh7th/nvim-compe
- Commenting: terrortylor/nvim-comment
- Which-key: wbthomason/packer.nvim
- Indent lines: lukas-reineke/indent-blankline.nvim
- Superior light (and dark) colorschemes: RRethy/nvim-base16
- TUI finder: credit to nvim-telescope/telescope.nvim (and dependencies)
- Tab bar: credit to romgrk/barbar.nvim

## Credit for getting plugins to work nicely together:
-  christianchiarulli/lunarvim aka "Chris@Machine"
-  my work for enabling me to slack off

# TODOs
- TODO Investigate incorporated/default/minimal package management for more control and stability (particularly around what loads and when)
- TODO Incorporate LSP, Treesitter, DAP and other essential IDE components
