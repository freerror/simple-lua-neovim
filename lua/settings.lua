-- What's working so far:
-- * Autocomplete
-- * Comments plugin
-- * Which-key (basic settings too, terminal bindings, old bindings)
-- * VS Code and LUA Separation (good enough)
-- * Telescope [ done ]
-- * LSP [ next ]
-- * Treesitter [ next ]
-- * Nvim-tree [ next ]
-- * Undotree [ next ]


---  HELPER VARS ---
not_vscode = function()
  return vim.g.vscode == nil
end

if not_vscode() then

  ---  MAPPINGS ---

  vim.g.mapleader = ' '

  -- easier ^
  vim.api.nvim_set_keymap('n', 'gs', '^', {noremap = true, silent = true})
  -- easier $
  vim.api.nvim_set_keymap('n', 'gl', '$', {noremap = true, silent = true})
  -- easier 0
  vim.api.nvim_set_keymap('n', 'gh', '0', {noremap = true, silent = true})

  -- unmigrated mappings
  vim.cmd([[
    "===Personal Datestrings and their Variations===
    " Typical Zettelkasten ID
    iab <expr> zds strftime('%y%m%d%H%M')
    nnoremap <F5> "=strftime('%y%m%d%H%M')<CR>p
    inoremap <F5> <C-R>=strftime('%y%m%d%H%M')<CR>
    " New Zettel
    nnoremap <leader>zn :e <C-R>=strftime('%y%m%d%H%M')<CR> 
    " Make file from square bracket link
    nnoremap <leader>zm vi]y:e <C-R>+.md
    " Filename (Useful for creating titles etc)
    inoremap <F7> <C-R>=expand("%:t")<CR>
    " Reading/Orgdown friendly
    inoremap <F6> <C-R>=strftime('%Y-%m-%d %a %H:%M')<CR>
    " Started Orgdown todo
    nnoremap <leader>os o<tab>- STARTED: <C-R>=strftime('%Y-%m-%d %a %H:%M')<CR><ESC>
    " Close Orgdown todos
    nnoremap <leader>od ^wcwDONE<esc>o<tab>- CUSTOMER: Unidentified<esc>ko<tab>- CLOSED: <C-R>=strftime('%Y-%m-%d %a %H:%M')<CR><ESC>
    " Open settings
    if has('win32')
      nnoremap <leader>ve :e $home\AppData\Local\nvim\lua\settings.lua<CR>
      nnoremap <leader>vp :e $home\AppData\Local\nvim\lua\plugins\init.lua<CR>
      set shell=powershell.exe
    else
      nnoremap <leader>ve :e ~/.config/nvim/lua/settings.lua<CR>
      nnoremap <leader>vp :e ~/.config/nvim/lua/plugins/init.lua<CR>
  ]])
  -- better window movement
  vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', {noremap = true, silent = true})
  vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', {noremap = true, silent = true})
  vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', {noremap = true, silent = true})
  vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', {noremap = true, silent = true})

  -- send overwritten text in visual mode to blackhole register
  vim.cmd('vnoremap p "_c<C-r>+<esc>')
  vim.cmd('vnoremap p "_c<C-r>+<esc>')

  -- Tab switch buffer (depends barbar plugin)
  vim.api.nvim_set_keymap('n', '<TAB>', ':bnext<CR>', {noremap = true, silent = true})
  vim.api.nvim_set_keymap('n', '<S-TAB>', ':bprevious<CR>', {noremap = true, silent = true})

  -- Close buffer (tab), closing nvim-tree and reopening if it was open
  vim.api.nvim_set_keymap('n', '<C-w>', ':lua close_tab_tree_reopen()<CR>', {noremap = true, silent = true})

  -- Comments (depends nvim-comments plugin)
  vim.api.nvim_set_keymap('n', '<C-_>', ':CommentToggle<CR>', {noremap = true, silent = true})
  vim.api.nvim_set_keymap('v', '<C-_>', ':CommentToggle<CR>', {noremap = true, silent = true})
  vim.api.nvim_set_keymap('n', '<C-/>', ':CommentToggle<CR>', {noremap = true, silent = true})
  vim.api.nvim_set_keymap('v', '<C-/>', ':CommentToggle<CR>', {noremap = true, silent = true})

  -- find files
  vim.api.nvim_set_keymap('n', '<Leader>f', ':Telescope find_files<CR>', {noremap = true, silent = true})

  -- Exit terminal
  vim.api.nvim_set_keymap('t', '<C-k>', '<C-\\><C-n>', {noremap = true, silent = false})

  -- Save Buffer
  vim.api.nvim_set_keymap('n', '<C-s>', ':w<CR>', {noremap = true, silent = true})
  vim.api.nvim_set_keymap('i', '<C-s>', '<esc>:w<CR>i', {noremap = true, silent = true})
  vim.api.nvim_set_keymap('v', '<C-s>', '<esc>:w<CR>', {noremap = true, silent = true})

  -- Better nav for omnicomplete
  vim.cmd('inoremap <expr> <c-j> (\"\\<C-n>\")')
  vim.cmd('inoremap <expr> <c-k> (\"\\<C-p>\")')


  ---  GENERAL SETTINGS  ---

  -- colorscheme
  pcall(vim.cmd, 'colorscheme base16-one-light')

  -- cwd follows files
  vim.opt.autochdir = false -- use <leader>. instead

  -- how the scrolling tracks cursor (999 makes it stay centred)
  vim.opt.scrolloff = 10

  -- allows neovim to access the system clipboard
  vim.opt.clipboard = "unnamedplus"

  -- more space in the neovim command line for displaying messages
  vim.opt.cmdheight = 2

  -- fix indentline for now
  -- vim.opt.colorcolumn = "99999"
  -- vim.opt.completeopt = {'menuone', 'noselect'}

  -- so that `` is visible in markdown files
  vim.opt.conceallevel = 0

  -- the encoding written to a file
  vim.opt.fileencoding = "utf-8"

  -- the font used in graphical neovim applications
  -- Note: Not supported by neovim-qt, use ../ginit.vim
  vim.cmd('set guifont="Fira_Code_Medium:h12:W500:cANSI:qDRAFT"')

  -- required to keep multiple buffers and open multiple buffers
  vim.opt.hidden = true

  -- highlight all matches on previous search pattern
  vim.opt.hlsearch = true

  -- ignore case in search patterns
  vim.opt.ignorecase = true

  -- allow the mouse to be used in neovim
  vim.opt.mouse = "a"

  -- pop up menu height
  vim.opt.pumheight = 10

  -- whether to show mode e.g. INSERT
  vim.opt.showmode = false

  -- always show tabs
  vim.opt.showtabline = 2

  -- smart case
  vim.opt.smartcase = true

  -- make indenting smarter again
  vim.opt.smartindent = true

  -- force all horizontal splits to go below current window
  vim.opt.splitbelow = true

  -- force all vertical splits to go to the right of current window
  vim.opt.splitright = true

  -- creates a swapfile
  vim.opt.swapfile = true

  -- set term gui colors (most terminals support this)
  vim.opt.termguicolors = true

  -- time to wait for a mapped sequence to complete (in milliseconds)
  vim.opt.timeoutlen = 0

  -- set the title of window to the value of the titlestring
  vim.opt.title = true

  -- what the title of the window will be set to
  vim.opt.titlestring = "%<%F%=%l/%L - nvim"

  -- set an undo directory
  -- vim.opt.undodir = CACHE_PATH .. '/undo'

  -- enable persisten undo
  vim.opt.undofile = true

  -- faster completion
  vim.opt.updatetime = 300

  -- convert tabs to spaces
  vim.opt.expandtab = true
  vim.cmd('set expandtab')

  -- the number of spaces inserted for each indentation
  vim.opt.shiftwidth = 2

  -- don't pass messages to |ins-completion-menu|
  vim.opt.shortmess:append("c")

  -- spaces to insert for a tab
  vim.opt.tabstop = 2

  -- highlight the current line
  vim.opt.cursorline = false

  -- set numbered lines
  vim.opt.number = true

  -- set relative numbered lines
  vim.opt.relativenumber = false

  -- set complete options
  vim.opt.completeopt = {'menuone', 'noselect'}

  -- always show the sign column, otherwise it would shift the text each time
  vim.opt.signcolumn = "yes"

  -- whether to wrap lines
  vim.opt.wrap = false
  vim.opt.linebreak = true

  -- preferred file format
  vim.cmd('set ff=unix')

  -- if a file is being edited by another program 
  -- (or was written to file while editing with another program), 
  -- it is not allowed to be edited
  vim.opt.writebackup = true
  
  -- backup file cration
  vim.opt.backup  = true
  vim.opt.backupdir = ""
  vim.opt.backupdir = "~/tmp,/tmp"

  ---  PLUGINS  ---
  -- bootstrap packer
  local install_path = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    vim.fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.api.nvim_command 'packadd packer.nvim'
  end

  -- plugin definitions
  require('plugins') -- ./plugins/init.lua
  -- plugin settings (TODO can these be put in the plugin definitions setup/config etc)
  require('plugins.lightline') -- ./plugins/lightline/init.lua
  require('plugins.which-key') -- ./plugins/which-key/init.lua
  require('plugins.nvim-tree') -- ./plugins/nvim-tree/init.lua
  require('plugins.lsp') -- ./plugins/lsp/init.lua

  -- load opt plugins
  vim.cmd('au VimEnter * PackerLoad indent-blankline.nvim')

  -- utils
  require('utils') -- ./utils/init.lua

  -- recompile packer/settings automagically
  vim.cmd([[
  au BufWritePost settings.lua source %
  au BufWritePost ginit.vim source %
  if has('win32')
    au BufWritePost */plugins/init.lua lua reload_config_windows()
  else
    au BufWritePost */plugins/init.lua lua reload_config_linux()
  ]])
else
  require('vscode')
end
