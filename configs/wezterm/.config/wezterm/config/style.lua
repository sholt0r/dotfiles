local style = {}

function style.apply(config)
	config.enable_scroll_bar = false
	config.hide_tab_bar_if_only_one_tab = true
	config.tab_bar_at_bottom = true
	--config.window_background_opacity = 100
	--config.macos_window_background_blur = 30
	config.window_decorations = "RESIZE"
	config.use_resize_increments = false
	config.adjust_window_size_when_changing_font_size = false
	config.window_padding = {
		left = 10,
		right = 10,
		top = 10,
		bottom = 10
	}
	config.font_size = 13
	config.color_scheme = 'OneHalfDark'
	config.default_cursor_style = 'BlinkingBar'
end

return style
