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

## Satisfy requirements
- Fira Code Font
- Node.js NPM

## Move your old config out (both nvim and nvim-data)

### Linux 
```
mv ~/.config/nvim ~/.config/nvim_old; mv ~/.local/share/nvim ~/.local/share/nvim_old
```

## Clone the repo
### Linux
```
git clone https://github.com/account-sxf/simple-lua-neovim.git ~/.config/nvim
```
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
- Tab and buffer line: credit to itchyny/lightline.vim and mengelbrecht/lightline-bufferline

## Credit for getting plugins to work nicely together:
-  christianchiarulli/lunarvim aka "Chris@Machine"
-  my work for enabling me to slack off

# TODOs
- TODO LSP
- TODO Treesitter
- TODO DAP
- TODO Move ALL user configuration to settings.lua/or something similar to lv-settings
- TODO Fix clashing comment + bracket matches highlight
