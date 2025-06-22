local keys = {}

function keys.apply(config)
	config.keys = {
		{
			key = 'LeftArrow',
			mods = 'CMD',
			action = Wezterm.action.DisableDefaultAssignment
		},
		{
			key = 'RightArrow',
			mods = 'CMD',
			action = Wezterm.action.DisableDefaultAssignment
		},
		{
			key = 'UpArrow',
			mods = 'CMD',
			action = Wezterm.action.DisableDefaultAssignment
		},
		{
			key = 'DownArrow',
			mods = 'CMD',
			action = Wezterm.action.DisableDefaultAssignment
		},
	}
end

return keys
