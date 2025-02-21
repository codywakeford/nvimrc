local options = { noremap = true, silent = true }

vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
-- vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Tree
vim.keymap.set("n", "<C-e>", ":NvimTreeToggle<CR>", options)
vim.api.nvim_set_keymap("n", "<leader>n", ":NvimTreeCreate<CR>", options)
vim.api.nvim_set_keymap("n", "<leader>f", ":NvimTreeCollapse:<CR>", options)


-- File
vim.api.nvim_set_keymap("n", "<C-s>", ":w<CR>", options)
vim.api.nvim_set_keymap("i", "<C-s>", "<Esc>:w<CR>a", options)

-- Comments
vim.api.nvim_set_keymap("n", "<C-#>", "gcc", options)
vim.api.nvim_set_keymap("v", "<C-#>", "gcc", options)

-- Zen
vim.api.nvim_set_keymap("n", "<leader>zz", ":TZAtaraxis<CR>", options)

-- Dashboard
vim.keymap.set("n", "<leader>#", ":Alpha<CR>", options)

-- Reload
vim.keymap.set("n", "<leader>,", function()
	-- Source the configuration
	vim.cmd("source ~/.config/nvim/init.lua")

	-- Print a message
	vim.notify("Neovim config reloaded!", vim.log.levels.INFO)
end, options)

vim.keymap.set("n", "<leader>s", function()
	vim.cmd(":w")
	vim.notify("File Saved", vim.log.levels.INFO)
end, options)

vim.keymap.set("n", "<leader>git", ":Git")

-- Error
vim.keymap.set("n", "<leader>ty", ":Lspsaga hover_doc<CR>", options)

-- Terminal
vim.keymap.set("n", "<leader>tt", ":Lspsaga term_toggle<CR>")
vim.keymap.set("t", "<leader>tt", "<C-\\><C-n><C-\\><C-n>", { noremap = true })

vim.keymap.set("n", "K", function()
	local bufnr = vim.api.nvim_get_current_buf()
	local diagnostics = vim.diagnostic.get(bufnr, { lnum = vim.fn.line(".") - 1 })
	local messages = {}

	local ui = {
		border = "rounded",
		max_width = 80,
		max_height = 20,
	}

	-- Collect diagnostic messages
	for _, d in ipairs(diagnostics) do
		table.insert(messages, d.message)
	end

	-- Get hover documentation
	vim.lsp.buf.hover()

	-- Open diagnostics float with hover info
	if #messages > 0 then
		vim.defer_fn(function()
			vim.diagnostic.open_float(nil, ui)
		end, 200) -- Small delay so both can be seen
	end
end, { noremap = true, silent = true })
