local general = {}

function general.apply(config)
	config.enable_wayland = false
	config.check_for_updates = false
	config.automatically_reload_config = true
	config.launch_menu = {}
end

return general
