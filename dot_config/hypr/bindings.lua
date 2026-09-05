-- Keep only your personal keybinding overrides here. Add new bindings or
-- unbind defaults before replacing them.

-- SUPER + L previously toggled the workspace between scrolling and dwindle.
hl.unbind("SUPER + L")

o.bind("SUPER + H", "Focus on left window", hl.dsp.focus({ direction = "l" }))
o.bind("SUPER + L", "Focus on right window", hl.dsp.focus({ direction = "r" }))

-- Download the active browser tab to ~/Videos.
o.bind("SUPER + ALT + D", "Download video", os.getenv("HOME") .. "/.local/bin/download-video")
