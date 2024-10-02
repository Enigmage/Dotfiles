-- Pull in the wezterm API
local wezterm = require("wezterm")
local keybinds = require("keybinds")

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
    config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

-- Base
-- config.color_scheme = "Gruvbox Material (Gogh)"
-- config.color_scheme = 'MaterialDarker'
config.color_scheme = 'Palenight (Gogh)'
config.font = wezterm.font("Fira Mono", { weight = "Regular" })

config.font_size = 18
config.window_decorations = "NONE"
config.window_background_opacity = 0.94
-- config.text_background_opacity = 0.3
config.hide_tab_bar_if_only_one_tab = true
config.scrollback_lines = 3000

-- Keybinds
keybinds.apply_to_config(config)

-- and finally, return the configuration to wezterm
return config
