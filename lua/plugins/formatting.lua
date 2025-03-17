local deps = {}

return {
	"stevearc/conform.nvim",
	dependencies = deps,

	config = function()
		require("conform").setup({
			log_level = vim.log.levels.DEBUG,
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
	end,
}
