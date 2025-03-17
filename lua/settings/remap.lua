local options = { noremap = true, silent = true }

vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Tree
vim.keymap.set("n", "<C-e>", ":NvimTreeToggle<CR>", options)
vim.api.nvim_set_keymap("n", "<leader>n", ":NvimTreeCreate<CR>", options)
vim.api.nvim_set_keymap("n", "<leader>f", ":NvimTreeCollapse:<CR>", options)

-- Floats
vim.keymap.set("n", "J", vim.diagnostic.open_float, { desc = "Show diagnostics (errors, warnings)" })

-- File
vim.api.nvim_set_keymap("n", "<C-s>", ":w<CR>", options)
vim.api.nvim_set_keymap("i", "<C-s>", "<Esc>:w<CR>a", options)

-- Find and Replace
vim.keymap.set("n", "<leader>fr", function()
	require("spectre").open()
end, { desc = "Open Spectre" })

-- Moving in vue files
vim.keymap.set("n", "<leader>b", "/<script <CR>")
vim.keymap.set("n", "<leader>n", "/<style lang=<CR>")

-- Comments
vim.api.nvim_set_keymap("n", "<C-#>", "gcc", options)
vim.api.nvim_set_keymap("v", "<C-#>", "gcc", options)

-- Panes
vim.keymap.set("n", "<M-h>", "<C-w>h", { noremap = true, silent = true })
vim.keymap.set("n", "<M-l>", "<C-w>l", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>v", ":vsp<CR> <C-w>l")

-- Quit
vim.keymap.set("n", "<leader>X", ":wa<CR>:qa<CR>", { noremap = true, silent = true }) -- Save all & quit

-- Zen
vim.api.nvim_set_keymap("n", "<leader>zz", ":TZAtaraxis<CR>", options)

-- Dashboard
vim.keymap.set("n", "<leader>#", ":Alpha<CR>", options)

-- Line Moving
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { noremap = true, silent = true })
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { noremap = true, silent = true })
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })

vim.keymap.set("n", "<leader>s", function()
	vim.cmd(":w")
	vim.notify("File Saved", vim.log.levels.INFO)
end, options)

vim.keymap.set("n", "<leader>on", ":ObsidianNew <CR> ", { noremap = true, silent = true })
