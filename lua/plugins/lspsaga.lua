return {
	"nvimdev/lspsaga.nvim",
	after = "nvim-lspconfig",
	config = function()
		local saga = require("lspsaga")

		saga.setup({
			lightbulb = {
				enable = false,
			},

			breadcrumbs = {
				enable = false,
			},

			hover = {
				max_width = 0.9, -- Set the width of the hover window (relative to the screen width)
				max_height = 0.8, -- Set the height of the hover window (relative to the screen height)
			},
		})

		vim.keymap.set("n", "K", ":Lspsaga hover_doc<CR>")
		vim.keymap.set("n", "gk", ":Lspsaga peek_type_definition<CR>")
		vim.keymap.set("n", "ga", ":Lspsaga code_action<CR>")
	end,
}
