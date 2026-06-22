-- Trigger when the switch is toggled.
hl.bind("switch:on:Lid Switch", hl.dsp.exec_cmd("hyprlock"), { locked = true })
-- Trigger when the switch is turning off.
-- hl.bind("switch:off:Lid Switch", hl.dsp.exec_cmd("good-bye.sh"), { locked = true })