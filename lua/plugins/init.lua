-- packer
-- vim.cmd [[packadd packer.nvim]] -- when packer opt
-- not https://github.com/neovim/neovim/pull/12632 merged:
-- vim._update_package_paths()

return require('packer').startup(function()
  -- packer (manages itself)
  use {'wbthomason/packer.nvim'}

  -- vim-sneak
  use {'justinmk/vim-sneak'}

  -- whichkey
  use {'folke/which-key.nvim', -- ./which-key/init.lua
       disable = false}

  -- comments
  use {"terrortylor/nvim-comment",
       cmd = "CommentToggle",
       config = function()
           require('nvim_comment').setup()
       end}

  -- indent line
  use {'lukas-reineke/indent-blankline.nvim', opt = true}

  -- lightline
  use {'itchyny/lightline.vim'}

  -- lightline-bufferline
  use {'mengelbrecht/lightline-bufferline'}

  -- nvim-tree
  use {'kyazdani42/nvim-tree.lua'}

  -- color
  use {'RRethy/nvim-base16'}

  -- telescope
  use {"nvim-lua/popup.nvim"}
  use {"nvim-lua/plenary.nvim"}
  use {"tjdevries/astronauta.nvim"}
  use {"nvim-telescope/telescope.nvim", -- ./telescope/init.lua
       config = [[require('plugins.telescope')]],
       cmd = "Telescope"}

  -- autocomplete
  use {"hrsh7th/nvim-compe", -- ./compe/init.lua
       event = "InsertEnter",
       config = function()
         require("plugins.compe").config()
       end}

  -- LSP
  use {"neovim/nvim-lspconfig"} -- ./lsp/init.lua
end)
