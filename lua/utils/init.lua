function reload_config_windows()
  vim.cmd([[
    source ~/AppData/Local/nvim/lua/settings.lua
    source ~/AppData/Local/nvim/lua/plugins/init.lua
    PackerCompile
  ]])
end

function reload_config_linux()
  vim.cmd([[
    source ~/.config/nvim/lua/settings.lua
    source ~/.config/nvim/lua/plugins/init.lua
    PackerCompile
  ]])
end

-- help with the nvim-tree problem of open tree when closing buffers
vim.cmd([[
let g:tree_open = 0
function! Tree_Toggle()
    if g:tree_open
        let g:tree_open = 0
    else
        let g:tree_open = 1
    endif
endfunction
]])
