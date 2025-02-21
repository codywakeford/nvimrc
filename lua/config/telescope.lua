local builtin = require("telescope.builtin")
vim.keymap.set("n", "'", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<C-p>", builtin.git_files, { desc = "Telescope find files" })
vim.keymap.set("n", "@", function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)

require("telescope").setup({
	pickers = {
		find_files = {
			hidden = true, -- Show hidden files (dotfiles)
		},
	},
	defaults = {
		file_ignore_patterns = { "%.git/" }, -- Optional: Ignore `.git` directory
	},
})
