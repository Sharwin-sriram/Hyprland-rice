-- .config/hypr/hyprland.lua
hl.config({
    plugin = {
        scrolloverview = {
            gesture_distance = 500, -- how far is the "max" for the gesture
            scale = 0.8, -- preferred overview scale
            workspace_gap = 20,
            -- layout = "vertical", -- vertical or horizontal
            layout = "vertical", -- vertical or horizontal
            wallpaper = 0, -- 0: global only, 1: per-workspace only, 2: both
            -- wallpaper = 1, -- 0: global only, 1: per-workspace only, 2: both
            blur = false, -- blur only the main overview wallpaper

            shadow = {
                enabled = false,
                range = 50,
                render_power = 3,
                color = 0xee1a1a1a,
            },

            input = {
                drag_mode = 0,
                scrolling_mode = 2
            }
        },
    },
})

hl.bind("ALT + SHIFT + TAB", function()
    hl.plugin.scrolloverview.overview("on")
    -- hl.plugin.scrolloverview.navigate("left")
    hl.plugin.scrolloverview.navigate("up")
end)

hl.bind("ALT + TAB" , function()
    hl.plugin.scrolloverview.overview("on")
    -- hl.plugin.scrolloverview.navigate("right")
    hl.plugin.scrolloverview.navigate("down")
end)

-- hl.bind("ALT", hl.dispatch(hl.plugin.scrolloverview.overview("off")))

hl.define_submap("scrolloverview", function()
    hl.bind("ALT", hl.plugin.scrolloverview.overview("off"), { release = true, transparent = true } )
    hl.bind("ALT + SHIFT + TAB",  hl.plugin.scrolloverview.navigate("left"))
    hl.bind("ALT + SHIFT + TAB",  hl.plugin.scrolloverview.navigate("up"))
    -- hl.bind("ALT + TAB",   hl.plugin.scrolloverview.navigate("right"))
    hl.bind("ALT + TAB",   hl.plugin.scrolloverview.navigate("down"))
    -- hl.bind("left",   hl.plugin.scrolloverview.navigate("left"))
    hl.bind("right",  hl.plugin.scrolloverview.navigate("right"))
    hl.bind("up",     hl.plugin.scrolloverview.navigate("up"))
    hl.bind("down",   hl.plugin.scrolloverview.navigate("down"))
    hl.bind("return", hl.plugin.scrolloverview.overview("select"))
    hl.bind("escape", hl.plugin.scrolloverview.overview("off"))
    
    hl.bind("mouse:272", function()
        -- Select the clicked window, or just the workspace if no window was clicked, then close the overview. This is the default behaviour if submap is not defined.
        hl.plugin.scrolloverview.overview("select")
        hl.plugin.scrolloverview.window("select")
        hl.plugin.scrolloverview.overview("off")
    end, { mouse = true })
    hl.bind("mouse:274", hl.plugin.scrolloverview.window("close"), { mouse = true })
end)

-- Example Hyprland bind that keeps working inside the submap:
for i = 1, 10 do
    local key = i % 10
    hl.bind("SUPER + " .. key, hl.dsp.focus({ workspace = i }), { submap_universal = true })
end