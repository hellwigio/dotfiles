return {
  {
    "lmilojevicc/herdr-splits.nvim",
    cond = vim.env.HERDR_ENV == "1",
    event = "VeryLazy",
    opts = {
      at_edge = "stop",
      nav_at_edge = "stop",
    },
    keys = {
      { "<C-h>", function() require("herdr-splits").move_cursor_left() end, desc = "Navigate left (Neovim/Herdr)" },
      { "<C-j>", function() require("herdr-splits").move_cursor_down() end, desc = "Navigate down (Neovim/Herdr)" },
      { "<C-k>", function() require("herdr-splits").move_cursor_up() end, desc = "Navigate up (Neovim/Herdr)" },
      { "<C-l>", function() require("herdr-splits").move_cursor_right() end, desc = "Navigate right (Neovim/Herdr)" },
    },
  },
}
