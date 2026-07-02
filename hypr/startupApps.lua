hl.on("hyprland.start", function()
	hl.exec_cmd("hyprpaper")
	hl.exec_cmd("hypridle")
	hl.exec_cmd("hyprpm reload")
	hl.exec_cmd("systemctl --user start graphical-session.target")
	hl.exec_cmd("systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
	hl.exec_cmd("systemctl --user start hyprpolkitagent")
	hl.exec_cmd("waybar -c $HOME/.config/waybar/config-top.jsonc -s $HOME/.config/waybar/style-top/style-top.css")
	hl.exec_cmd(
		"waybar -c $HOME/.config/waybar/config-bottom.jsonc -s $HOME/.config/waybar/style-bottom/style-bottom.css"
	)
end)
