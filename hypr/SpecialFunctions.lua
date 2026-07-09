-- Trigger when the switch is toggled.
-- hl.bind("switch:on:Lid Switch", hl.dsp.exec_cmd("hyprlock"), { locked = true })
-- Trigger when the switch is turning off.
hl.bind("switch:off:Lid Switch", hl.dsp.exec_cmd("hyprlock"), { locked = true })

local mainMod = "SUPER"
-- Dynamically move windows between workspaces
function move()
    local borderSize = hl.get_config("general.border_size")
    print(borderSize)
end
hl.bind(mainMod .. " + CTRL + SHIFT + left", move)

-- hl.bind("K", move)
hl.bind(mainMod .. " + CTRL + SHIFT + left", hl.dsp.window.move({ workspace = "e-1" }))
hl.bind(mainMod .. " + CTRL + SHIFT + right", hl.dsp.window.move({ workspace = "e+1", workspace = "empty" }))