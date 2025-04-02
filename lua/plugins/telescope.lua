local dependencies = { "nvim-lua/plenary.nvim" }

vim.api.nvim_set_keymap("n", "<leader>pt", ":lua SearchAndPeekDefinition()<CR>", { noremap = true, silent = true })

function config()
	local builtin = require("telescope.builtin")
	require("telescope").load_extension("refactoring")

	vim.keymap.set("n", "'", builtin.find_files, { desc = "Telescope find files" })

	vim.keymap.set("n", "@", ":Telescope live_grep<CR>", { noremap = true, silent = true })

	-- Obsidian
	local vault_path = "~/obsidian"
	vim.keymap.set(
		"n",
		"<leader>o'",
		":lua require('telescope.builtin').find_files({cwd='" .. vault_path .. "'})<CR>",
		{ noremap = true, silent = true }
	)

	vim.keymap.set("n", "<leader>fs", function()
		require("telescope.builtin").find_files({
			search_dirs = { "services" },
		})
	end, { desc = "Find files in predefined path" })

	vim.keymap.set("n", "<leader>fc", function()
		require("telescope.builtin").find_files({
			search_dirs = { "controllers" },
		})
	end, { desc = "Find files in predefined path" })

	vim.keymap.set("n", "<leader>ft", function()
		require("telescope.builtin").find_files({
			prompt_title = "Find Test Files",
			search_dirs = { "tests", "spec", "cypress", "src" },
			hidden = true,
			no_ignore = true,
			file_ignore_patterns = {
				"node_modules",
				"vendor/",
				"dist/",
				"coverage/",
			},
			find_command = {
				"rg",
				"--files",
				"--hidden",
				"--follow",
				"--glob",
				"**/*test.*",
				"--glob",
				"**/*spec.*",
				"--glob",
				"**/*e2e.*",
				"--glob",
				"cypress/**/*",
			},
		})
	end, { noremap = true, silent = true })
	vim.keymap.set(
		"n",
		"<leader>@",
		":lua require('telescope.builtin').live_grep({cwd='" .. vault_path .. "'})<CR>",
		{ noremap = true, silent = true }
	)

	require("telescope").setup({
		defaults = {
			file_sorter = require("telescope.sorters").get_fzy_sorter,
			generic_sorter = require("telescope.sorters").get_fzy_sorter,
			cache_picker = {
				num_pickers = 10, -- Cache the last 10 searches
			},
			preview = {
				check_mime_type = true, -- Don't try to preview large binary files
			},
			vimgrep_arguments = {
				"rg",
				"--color=never",
				"--no-heading",
				"--with-filename",
				"--line-number",
				"--column",
				"--smart-case",
				"--hidden",
				"--glob=!.git/",
			},
			file_ignore_patterns = {
				"node_modules",
				".nuxt",
				".output/*",
				"^cypress/",
				"^%.git/",
				"%.lock",
				"vendor/",
				"%.lock",
				"%.zip",
				"%.tar.gz",
				"%.rar",
				"%.7z",
				"%.avif",
				"%.webp",
				"%.png",
				"%.pdf", -- Ignore PDFs
				"%.mp4", -- Ignore videos
				"%.mp3", -- Ignore audio
			},
		},
		pickers = {
			find_files = {
				hidden = true,
				no_ignore = true,
				find_command = { "fd", "--type", "f", "--hidden", "--exclude", ".git" },
			},
		},
	})
end

return {
	"nvim-telescope/telescope.nvim",
	dependencies = dependencies,
	config = config,
}
