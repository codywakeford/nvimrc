vim.keymap.set("n", "<leader>go", ":ObsidianNew <CR> ", { noremap = true, silent = true })

return {
	"epwalsh/obsidian.nvim",
	version = "*",
	lazy = true,
	ft = "markdown",

	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	opts = {
		workspaces = {
			{
				name = "vault",
				path = "~/obsidian",
			},
		},
	},
}
