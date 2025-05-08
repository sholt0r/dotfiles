local wezterm = require 'wezterm'

return {
  -- General
  enable_wayland = true,
  enable_scroll_bar = false,
  check_for_updates = false,
  automatically_reload_config = true,

  -- Window
  window_decorations = "NONE", -- closest match to 'Buttonless'
  hide_tab_bar_if_only_one_tab = true,
  tab_bar_at_bottom = true,
  window_background_opacity = 0.95,
  macos_window_background_blur = 30,
  use_resize_increments = true,
  window_padding = {
    left = 10,
    right = 10,
    top = 10,
    bottom = 10,
  },
  launch_menu = {},
  default_prog = { wezterm.shell or os.getenv("SHELL") },

  -- Font
  font = wezterm.font_with_fallback({
    { family = "GeistMono Nerd Font Mono", weight = "Regular" },
  }),
  font_size = 16.0,
  font_rules = {
    {
      intensity = "Bold",
      italic = false,
      font = wezterm.font("GeistMono Nerd Font Mono", { weight = "Bold" }),
    },
    {
      intensity = "Half",
      italic = false,
      font = wezterm.font("GeistMono Nerd Font Mono", { weight = "DemiBold" }),
    },
    {
      intensity = "Normal",
      italic = true,
      font = wezterm.font("GeistMono Nerd Font Mono", { italic = true }),
    },
    {
      intensity = "Bold",
      italic = true,
      font = wezterm.font("GeistMono Nerd Font Mono", { weight = "Bold", italic = true }),
    },
  },
  keys = {
    -- Example: override CMD+Left and CMD+Right to do nothing
    { key = "LeftArrow",  mods = "CMD", action = wezterm.action.DisableDefaultAssignment },
    { key = "RightArrow", mods = "CMD", action = wezterm.action.DisableDefaultAssignment },
    { key = "UpArrow",    mods = "CMD", action = wezterm.action.DisableDefaultAssignment },
    { key = "DownArrow",  mods = "CMD", action = wezterm.action.DisableDefaultAssignment },
  },

  -- Colors
  colors = {
    foreground = "#c5cfdf",
    background = "#282b33",
    cursor_bg = "#c5cfdf",
    cursor_border = "#c5cfdf",
    cursor_fg = "#282b33",

    ansi = {
      "#3f4350", -- black
      "#df5460", -- red
      "#a4e174", -- green
      "#d08f51", -- yellow
      "#51adf8", -- blue
      "#cb7ed9", -- magenta
      "#5ecddd", -- cyan
      "#babfc9", -- white
    },
    brights = {
      "#707681", -- black
      "#de5460", -- red
      "#a3e174", -- green
      "#d08f51", -- yellow
      "#51adf8", -- blue
      "#cb7ed9", -- magenta
      "#5ecddc", -- cyan
      "#fefefe", -- white
    },
  },

  -- Cursor
  default_cursor_style = "BlinkingBar",
}
