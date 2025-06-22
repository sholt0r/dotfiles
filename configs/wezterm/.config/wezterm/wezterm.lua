Wezterm = require 'wezterm'

local general = require('config.general')
local keys = require('config.keys')
local style = require('config.style')

local config = Wezterm.config_builder()

general.apply(config)
keys.apply(config)
style.apply(config)

return config
