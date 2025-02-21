local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "isort", "black" },
    rust = { "rustfmt", lsp_format = "fallback" },
    javascript = { "prettierd", "prettier", stop_after_first = true },
  }
}

-- Use lazy.nvim to load and set up the plugin
return {
  "stevearc/conform.nvim",
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        lua = { "stylua" },

        javascript = {
          "prettierd",
          "prettier",
          stop_after_first = true,
        },

        typescript = {
          "prettierd",
          "prettier",
          stop_after_first = true,
        },

        vue = {
          "prettierd",
          "prettier",
          stop_after_first = true,
        },

        json = {
          "prettierd",
          "prettier",
          stop_after_first = true,
        },

         html = { "prettierd", "prettier" }, 
      },

      format_on_save = {
        timeout_ms = 500,
        lsp_format = "fallback",
      },
    })
  end
}
