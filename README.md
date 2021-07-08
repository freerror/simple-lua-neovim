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
- Ergonomic

# Set up
1. Clone the repo
2. Install wbthomason/packer.nvim
3. Run PackerSync
4. Reopen a few times...trying not to cry

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
credit for getting these plugins to work nicely together:
-  christianchiarulli/lunarvim aka "Chris@Machine"
-  my work for enabling me to slack off

# TODOs
- TODO Investigate dropping all package management for more control and stability (particularly around what loads and when)
- TODO Incorporate LSP, Treesitter, DAP and other niceties
