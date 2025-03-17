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

vim.api.nvim_set_keymap("n", "<Leader>h", ":lua vim.lsp.buf.hover(<CR>", { noremap = true, silent = true })

-- LSP
-- Default LSP keybindings
local opts = { noremap = true, silent = true }

-- Go to definition
vim.api.nvim_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)

-- Go to declaration
vim.api.nvim_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)

-- Go to type definition
vim.api.nvim_set_keymap("n", "gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)

-- Show references
vim.api.nvim_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)

-- Show symbol information (hover)
vim.api.nvim_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)

-- Signature help (e.g., function signature)
vim.api.nvim_set_keymap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)

-- Rename symbol under cursor
vim.api.nvim_set_keymap("n", "rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)

-- Code actions (e.g., fix or refactor)
vim.api.nvim_set_keymap("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)

-- Jump to next diagnostic (error/warning)
vim.api.nvim_set_keymap("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)

-- Jump to previous diagnostic (error/warning)
vim.api.nvim_set_keymap("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)

-- Show diagnostics in a floating window
vim.api.nvim_set_keymap(
	"n",
	"<leader>e",
	"<cmd>lua vim.lsp.diagnostic.open_float(nil, { focusable = false })<CR>",
	opts
)

-- Show all diagnostics for the current buffer
vim.api.nvim_set_keymap("n", "<leader>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)

-- Formatting the current buffer
vim.api.nvim_set_keymap("n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
