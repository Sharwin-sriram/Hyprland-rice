function batteryMode()
	hl.monitor({
		output = "",
		mode = "1920x1200@60",
		position = "0x0",
		scale = "1",
	})
	hl.config({
		general = {
			resize_on_border = false,
			allow_tearing = false,
			layout = "dwindle",
		},

		decoration = {
			active_opacity = 1.0,
			inactive_opacity = 1.0,

			shadow = {
				enabled = false,
			},

			blur = {
				enabled = false,
			},
		},

		animations = {
			enabled = true,
		},
	})
end

-- batteryMode()
