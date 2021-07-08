function reload_config_windows()
  vim.cmd([[
    source ~/AppData/Local/nvim/lua/settings.lua
    source ~/AppData/Local/nvim/lua/plugin_settings.lua
    PackerInstall
  ]])
end

function reload_config_linux()
  vim.cmd([[
    source ~/.config/nvim/lua/settings.lua
    source ~/.conig/nvim/lua/plugin_settings.lua
    PackerInstall
  ]])
end
