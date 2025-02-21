return {
	"nvim-tree/nvim-tree.lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("nvim-tree").setup({
			actions = {
				open_file = {
					quit_on_open = true,
				},
			},
			sort = {
				sorter = "case_sensitive",
			},
			view = {
				width = 30,
			},
			renderer = {
				group_empty = true,
			},
			filters = {
				dotfiles = false,
			},
			on_attach = function(bufnr)
				local api = require("nvim-tree.api")

				local function opts(desc)
					return { desc = "NvimTree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
				end

				-- Keybindings inside the NvimTree buffer
				vim.keymap.set("n", "<C-E>", api.tree.toggle, opts("Toggle Tree"))
vim.keymap.set("n", "a", api.fs.create, opts("Create File"))
vim.keymap.set("n", "d", api.fs.remove, opts("Delete File"))
vim.keymap.set("n", "x", api.fs.cut, opts("Cut File"))
vim.keymap.set("n", "r", api.fs.rename, opts("Rename File"))
vim.keymap.set("n", "p", api.fs.paste, opts("Paste File"))
				vim.keymap.set("n", "<CR>", api.node.open.edit, opts("Open File")) -- Ensure Enter opens files
			end,
		})
	end,
}
