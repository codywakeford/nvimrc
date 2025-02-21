return {
		"nvim-tree/nvim-tree.lua",
		requires = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("nvim-tree").setup({
				actions = {
					open_file = {
						quit_on_open = true, -- Closes tree when opening a file
					},
				},
			})
		end,
	}