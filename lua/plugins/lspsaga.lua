return {
	"nvimdev/lspsaga.nvim",
	after = "nvim-lspconfig",
	config = function()
		local saga = require("lspsaga")

		saga.setup({
			lightbulb = {
				enable = false,
			},

			symbol_in_winbar = {
				enable = true,
				show_file = true,
				folder_level = 3,
				hide_keyword = true,
				delay = 100,
			},

			hover = {
				max_width = 100, -- Set the width of the hover window (relative to the screen width)
				--max_height = 200, -- Set the height of the hover window (relative to the screen height)
				border = "rounded",
				wrap = true,
			},
		})

		vim.keymap.set("n", "K", ":Lspsaga hover_doc<CR>")
		vim.keymap.set("n", "gk", ":Lspsaga peek_type_definition<CR>")
		vim.keymap.set("n", "ga", ":Lspsaga code_action<CR>")
		vim.keymap.set("n", "<Leader>o", ":Lspsaga outline<CR>")
		vim.keymap.set("n", "<F2>", ":Lspsaga rename<CR>")
	end,
}
