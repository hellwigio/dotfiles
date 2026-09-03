-- Change the default Omarchy look'n'feel.

-- Keep every workspace in the niri-like horizontal scrolling layout.
hl.config({
  general = {
    gaps_in = 0,
    gaps_out = 0,
    layout = "scrolling",
  },

  scrolling = {
    -- Each window occupies the full usable width of the monitor.
    column_width = 1.0,
  },
})
