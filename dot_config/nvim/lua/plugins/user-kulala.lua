return {
  {
    "mistweaverco/kulala.nvim",
    event = { "SessionLoadPost", "VimLeavePre" },
    ft = { "http", "rest", "javascript", "lua" },
    keys = {
      { "<leader>Rs", desc = "Send request" },
      { "<leader>Ra", desc = "Send all requests" },
      { "<leader>Rb", desc = "Open scratchpad" },
    },
    opts = {
      global_keymaps = true,
    },
  },
}
