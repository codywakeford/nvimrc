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
vim.keymap.set(
    "n",
    "J",
    vim.diagnostic.open_float,
    { desc = "Show diagnostics (errors, warnings)"}
)

-- File
vim.api.nvim_set_keymap("n", "<C-s>", ":w<CR>", options)
vim.api.nvim_set_keymap("i", "<C-s>", "<Esc>:w<CR>a", options)

-- Moving in vue files
vim.keymap.set("n", "<leader>b", "/<script <CR>")
vim.keymap.set("n", "<leader>n", "/<style lang=<CR>")

-- Comments
vim.api.nvim_set_keymap("n", "<C-#>", "gcc", options)
vim.api.nvim_set_keymap("v", "<C-#>", "gcc", options)

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

