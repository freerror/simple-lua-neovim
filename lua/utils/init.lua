function reload_config_windows()
  vim.cmd([[
    source ~/AppData/Local/nvim/lua/settings.lua
    source ~/AppData/Local/nvim/lua/plugins/init.lua
    PackerCompile
    PackerInstall
  ]])
end

function reload_config_linux()
  vim.cmd([[
    source ~/.config/nvim/lua/settings.lua
    source ~/.config/nvim/lua/plugins/init.lua
    PackerCompile
    PackerInstall
  ]])
end
