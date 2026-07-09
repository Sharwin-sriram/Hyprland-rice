---------------------
---- MY PROGRAMS ----
---------------------

-- Move cursor to an absolute position (global coordinates, spans all monitors)
local function move_cursor_to(x, y)
    hl.dispatch(hl.dsp.cursor.move({ x = x, y = y }))
end

local terminal = "kitty"
local fileManager = "thunar"
-- local menu = "hyprlauncher"
local menu = "tofi-drun -c ~/.config/tofi/config --drun-launch=true --num-results 7 --font /usr/share/fonts/TTF/JetBrainsMonoNerdFont-Regular.ttf --hint-font false"
local lockscreen = "loginctl lock-session"
local lockMenu = "wlogout"

local mainMod = "SUPER" -- Sets "Windows" key as main modifier

-- Example binds, see https://wiki.hypr.land/Configuring/Basics/Binds/ for more
local closeWindowBind = hl.bind(mainMod .. " + W", hl.dsp.window.close(), { repeating = true })
hl.bind(
	mainMod .. " + M",
	hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'")
)
hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd(terminal), { repeating = true })
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd(lockscreen))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + O", function() 
	hl.dispatch(hl.dsp.exec_cmd(lockMenu))
    move_cursor_to(1920,0)
end)

hl.bind(mainMod .. " + Z", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
-- hl.bind(mainMod .. " + TAB", hl.dsp.layout("togglesplit")) -- dwindle only
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen("fullscreen", "toggle")) -- Toggle fullscreen
hl.bind(mainMod .. " + SHIFT + F", hl.dsp.window.fullscreen("maximize", "toggle")) -- Toggle fullscreen

-- Screenshot keybind
hl.bind(mainMod .. " + C", hl.dsp.exec_cmd("$HOME/.config/hypr/scripts/screenshot.sh"))

hl.bind(mainMod .. " + Print", hl.dsp.exec_cmd("grim - | wl-copy"))
hl.bind(mainMod .. " + X", hl.dsp.exec_cmd("hyprpicker | wl-copy"))

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }))

-- Create a new workspace and Focus on it
hl.bind(mainMod .. " + D", hl.dsp.window.move({ workspace = "empty" }))

-- Jump to a new empty workspace
hl.bind(mainMod .. " + N", hl.dsp.focus({ workspace = "empty" }))

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
	local key = i % 10 -- 10 maps to key 0
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Swap two windows in a workspace left and right
hl.bind(mainMod .. "+ SHIFT + up", hl.dsp.window.swap({ direction = "up" }))
hl.bind(mainMod .. "+ SHIFT + down", hl.dsp.window.swap({ direction = "down" }))
hl.bind(mainMod .. "+ SHIFT + left", hl.dsp.window.swap({ next = true }))
hl.bind(mainMod .. "+ SHIFT + right", hl.dsp.window.swap({ prev = true }))

-- Switch windows using CTRL SUPER ARROW KEYS
hl.bind(mainMod .. " + CTRL + left", hl.dsp.focus({ workspace = "e-1" }))
hl.bind(mainMod .. " + CTRL + right", hl.dsp.focus({ workspace = "e+1" }))

-- Overlay workspaces
hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + A", hl.dsp.workspace.toggle_special("discord"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))
hl.bind(mainMod .. " + SHIFT + A", hl.dsp.window.move({ workspace = "special:discord" }))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness
hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 2%+"),
	{ locked = true, repeating = true }
)

hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%-"),
	{ locked = true, repeating = true }
)

hl.bind(
	"XF86AudioMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
	{ locked = true, repeating = true }
)

hl.bind(
	"XF86AudioMicMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
	{ locked = true, repeating = true }
)

hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })
