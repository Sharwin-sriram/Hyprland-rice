function gameMode()
	hl.monitor({
		output = "",
		mode = "1920x1200@165",
		position = "0x0",
		scale = "1",
	})
	hl.config({
		general = {
			gaps_in = 0,
			gaps_out = 0,

			border_size = 0,
			resize_on_border = false,
			allow_tearing = false,
			layout = "dwindle",
		},

		decoration = {
			rounding = 0,
			rounding_power = 0,

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

-- gameMode()