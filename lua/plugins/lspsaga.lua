local function search_and_peek()
	-- Start a Telescope search
	require("telescope.builtin").live_grep({
		-- Customize options as needed
	})
	-- After search, open peek definition for the selected symbol
	vim.api.nvim_command("Lspsaga peek_definition")
end

return {
	"nvimdev/lspsaga.nvim",
	after = "nvim-lspconfig",
	config = function()
		require("lspsaga").setup({
			lightbulb = {
				enable = false,
			},
		})

		-- In your Neovim Lua configuration
		vim.api.nvim_set_keymap(
			"n",
			"gb",
			':Telescope live_grep search="type " | Lspsaga peek_definition<CR>',
			{ noremap = true, silent = true }
		)
		vim.keymap.set("n", "gk", ":Lspsaga peek_type_definition<CR>")
		vim.keymap.set("n", "ga", ":Lspsaga code_action<CR>")
	end,
}
