local conform = require("conform")

conform.setup({
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
	},

	format_on_save = {
		timeout_ms = 10500,
		lsp_format = "fallback",
		lsp_fallback = true,
	},
})
