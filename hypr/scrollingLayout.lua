local mainMod = "SUPER"

hl.config({ 
    scrolling = {
	    fullscreen_on_one_column = true,
	    column_width = 0.95,
        focus_fit_method = 1,
        explicit_column_widths = "1, 0.9, 0.6, 0.4",
        -- wrap_focus = true,
        -- direction = "left"
    } 
})

-- To switch between windows in a floating/scrolling workspace:

-- hl.bind(mainMod .. " + Taqb", function()
-- hl.dispatch(hl.dsp.window.cycle_next())    -- Change focus to another window
-- hl.dispatch(hl.dsp.window.bring_to_top()) -- Bring it to the top
-- end)