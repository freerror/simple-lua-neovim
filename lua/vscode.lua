-- KEYMAPS

-- Simulate same TAB behavior in VSCode
vim.cmd('nmap <Tab> :Tabnext<CR>')
vim.cmd('nmap <S-Tab> :Tabprev<CR>')

-- Open file explorer
vim.cmd("nnoremap <silent> <Space>e :call VSCodeNotify('workbench.action.toggleSidebarVisibility')<CR>")

-- Open terminal
vim.cmd("nnoremap <silent> <Space>t :call VSCodeNotify('workbench.action.terminal.toggleTerminal')<CR>")

-- Run without debugging
vim.cmd("nnoremap <silent> <Space>r :call VSCodeNotify('workbench.action.debug.run')<CR>")

-- Close editor with Ctrl+w
vim.cmd("nnoremap <silent> <C-W> :call VSCodeNotify('workbench.action.closeActiveEditor')<CR>")

-- Better Navigation
vim.cmd("nnoremap <silent> <C-j> :call VSCodeNotify('workbench.action.navigateDown')<CR>")
vim.cmd("xnoremap <silent> <C-j> :call VSCodeNotify('workbench.action.navigateDown')<CR>")
vim.cmd("nnoremap <silent> <C-k> :call VSCodeNotify('workbench.action.navigateUp')<CR>")
vim.cmd("xnoremap <silent> <C-k> :call VSCodeNotify('workbench.action.navigateUp')<CR>")
vim.cmd("nnoremap <silent> <C-h> :call VSCodeNotify('workbench.action.navigateLeft')<CR>")
vim.cmd("xnoremap <silent> <C-h> :call VSCodeNotify('workbench.action.navigateLeft')<CR>")
vim.cmd("nnoremap <silent> <C-l> :call VSCodeNotify('workbench.action.navigateRight')<CR>")
vim.cmd("xnoremap <silent> <C-l> :call VSCodeNotify('workbench.action.navigateRight')<CR>")

-- Go to reference
vim.cmd("nnoremap gr <Cmd>call VSCodeNotify('editor.action.goToReferences')<CR>")

-- NEOVIM SETTINGS
vim.cmd("set ff=unix")
vim.cmd("set fileencoding=utf-8")
vim.cmd("set encoding=utf-8")
vim.cmd("set iskeyword+=-")
vim.cmd("set formatoptions-=cro")
vim.cmd("set backspace=start,eol,indent")
vim.cmd("set notimeout")
vim.cmd("silent! set noesckeys")
vim.cmd("set showcmd")
vim.cmd("set conceallevel=0")
vim.cmd("set tabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set smarttab")
vim.cmd("set expandtab")
vim.cmd("set autoindent")
vim.cmd("set signcolumn=yes")
vim.cmd("set clipboard=unnamedplus")
vim.cmd("set magic")
vim.cmd("set ignorecase")
vim.cmd("set smartcase")
vim.cmd("set incsearch")
vim.cmd("set matchpairs=(:),{:},[:],<:>")
vim.cmd('vnoremap p "_dP') -- send overwritten text to black hole
