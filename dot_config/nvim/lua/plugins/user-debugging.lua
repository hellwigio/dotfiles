return {
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      for _, tool in ipairs({ "debugpy", "delve", "php-debug-adapter" }) do
        if not vim.tbl_contains(opts.ensure_installed, tool) then
          table.insert(opts.ensure_installed, tool)
        end
      end
    end,
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    opts = {
      handlers = {
        -- Go is configured by nvim-dap-go.
        delve = function() end,
        -- PHP configurations and adapter are provided below and by the PHP extra.
        php = function() end,
      },
    },
  },
  {
    "mfussenegger/nvim-dap",
    opts = function()
      local dap = require("dap")
      dap.configurations.php = {
        {
          name = "Listen for Xdebug",
          type = "php",
          request = "launch",
          port = 9003,
        },
        {
          name = "Launch current PHP script (Xdebug)",
          type = "php",
          request = "launch",
          program = "${file}",
          cwd = "${workspaceFolder}",
          port = 9003,
          runtimeArgs = { "-dxdebug.mode=debug", "-dxdebug.start_with_request=yes" },
        },
      }
    end,
  },
}
