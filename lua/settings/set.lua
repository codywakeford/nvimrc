vim.opt.nu = true
vim.opt.relativenumber = true

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.o.conceallevel = 1
vim.g.lazy_load_plugins = false
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.conceallevel = 0
vim.opt.smartindent = true
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.breakindent = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 16
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.o.showtabline = 2
vim.opt.updatetime = 50
vim.o.cmdheight = 1
vim.g.mapleader = " "
vim.g["snacks#cursorword#enable"] = 0

local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap("n", "<Leader>h", ":lua vim.lsp.buf.hover(<CR>", opts)

-- stop Persistence => session won't be saved on exit
vim.keymap.set("n", "<leader>!", function()
	require("persistence").stop()
	vim.cmd("qa!")
end)

vim.keymap.set("n", "<C-f>", function()
	require("packages.telescope-project-picker").open_project()
end, { desc = "Find project in ~/git and cd" })

vim.keymap.set("n", "<leader>~", ":wa<CR>:qa<CR>", opts) -- Save all & quit
--
vim.api.nvim_set_keymap("n", "<Esc>[91;5u", ':echo "Right Ctrl + E pressed"<CR>', { noremap = true, silent = true })

vim.keymap.set("n", "<leader>vs", ":vsplit | enew<CR>", { noremap = false, silent = true }) -- New buffer in vertical split

-- Go to definition
vim.api.nvim_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)

-- Go to declaration
vim.api.nvim_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)

-- Show references
vim.api.nvim_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)

-- Rename symbol under cursor
vim.api.nvim_set_keymap("n", "rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)

-- Code actions (e.g., fix or refactor)
vim.api.nvim_set_keymap("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)

-- Jump to next diagnostic (error/warning)
vim.api.nvim_set_keymap("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)

-- Jump to previous diagnostic (error/warning)
vim.api.nvim_set_keymap("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)

-- Jump to next placeholder
vim.api.nvim_set_keymap("i", "<C-n>", [[<Cmd>lua require'luasnip'.jump(1)<Cr>]], opts)

-- Jump to previous placeholder
vim.api.nvim_set_keymap("i", "<C-p>", [[<Cmd>lua require'luasnip'.jump(-1)<Cr>]], opts)

-- Search for word on a line
vim.keymap.set("n", "<leader>/", function()
	local current_line = vim.fn.line(".")
	vim.api.nvim_feedkeys("/\\%" .. current_line .. "l", "n", false)
end, { desc = "Live search in current line" })

vim.keymap.set("n", "J", function()
	require("packages.hover").show_diagnostic_hover()
end, { desc = "Hover diagnostic (Markdown)" })
