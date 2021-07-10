vim.g.lightline = {
  ['colorscheme'] = 'wombat',
  ['separator'] = {['left'] = "", ['right'] = ""},
  ['subseparator'] = {['left'] = "", ['right'] = ""},
  ['component'] = {['filename'] = "%F",}
}
vim.cmd("let g:lightline.tabline = {'left': [['buffers']], 'right': [['close']]}")
vim.cmd("let g:lightline.component_expand = {'buffers': 'lightline#bufferline#buffers'}")
vim.cmd("let g:lightline.component_type = {'buffers': 'tabsel'}")
vim.cmd("let g:lightline.component_raw = {'buffers': 1}")
vim.cmd("let g:lightline#bufferline#clickable = 1")
vim.cmd("let g:lightline#bufferline#show_number = 0")
vim.cmd("let g:lightline#bufferline#shorten_path = 0")
vim.cmd("let g:lightline#bufferline#unnamed = ' untitled '")
