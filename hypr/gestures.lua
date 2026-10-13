hl.gesture({
	fingers = 3,
	direction = "horizontal",
	action = "workspace",
})

hl.gesture({
  fingers = 3,
  direction = "vertical",
  action = function()
    hl.plugin.scrolloverview.overview("toggle")
  end,
})

hl.gesture({
	fingers = 4,
	direction = "vertical",
	action = "special",
	workspace_name = "discord",
})