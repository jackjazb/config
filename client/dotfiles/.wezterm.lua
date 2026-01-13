-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices.
config.initial_cols = 120
config.initial_rows = 28

geist = wezterm.font("GeistMono Nerd Font")

config.font_size = 11
config.font = geist
config.window_frame = {
  font = geist,
  font_size = 10.0,
}
config.color_scheme = 'Ayu Dark (Gogh)'
config.keys = {
  {
    key = 'LeftArrow',
    mods = 'ALT',
    action = wezterm.action.ActivateTabRelative(-1) ,
  },
    {
    key = 'RightArrow',
    mods = 'ALT',
    action = wezterm.action.ActivateTabRelative(1) ,
  }
}

config.enable_wayland = false

return config