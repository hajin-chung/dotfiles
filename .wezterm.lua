local wezterm = require("wezterm")
local config

if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.enable_tab_bar = false
config.font = wezterm.font("CaskaydiaCove Nerd Font")
config.font_size = 14.0
config.window_padding = {
  left = 4,
  right = 4,
  bottom = 4,
  top = 4,
}
config.default_prog = { 'wsl' }
config.adjust_window_size_when_changing_font_size = false
config.window_background_opacity = 0.9
config.audible_bell = "Disabled"

return config
