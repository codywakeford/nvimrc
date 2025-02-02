vim.cmd([[packadd packer.nvim]])


return require("packer").startup(function(use)
    use({ "wbthomason/packer.nvim" })


    -- Telescope
    use({
        "nvim-telescope/telescope.nvim",
        tag = "0.1.8",
        requires = { { "nvim-lua/plenary.nvim" } },
    })


    -- Theme
    use("Mofiqul/vscode.nvim")
    use({
        "goolord/alpha-nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("cody.alpha") -- This should load your custom config from lua/cody/alpha.lua
        end,
    })
    use({
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    })
    use({
        "Pocco81/true-zen.nvim",
        config = function()
            require("true-zen").setup {
                -- your config goes here
                -- or just leave it empty :)
            }
        end,
    })

    -- Utils
    use("jiangmiao/auto-pairs")
    use("tpope/vim-commentary")
    use("mbbill/undotree")
    use({ "lewis6991/gitsigns.nvim", config = function() require("gitsigns").setup() end })

    -- Editor
    use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })
    use("theprimeagen/harpoon")
    use("tpope/vim-fugitive")
    use("posva/vim-vue")
    use("cakebaker/scss-syntax.vim")
    use("sheerun/vim-polyglot")

    -- use({
    --     'pmizio/typescript-tools.nvim',
    --     dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
    --     opts = {},
    --     ft = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'vue' },
    --     config = function()
    --         require('typescript-tools').setup {
    --             on_attach = function(client, bufnr)
    --                 client.server_capabilities.documentFormattingProvider = false
    --                 client.server_capabilities.documentRangeFormattingProvider = false
    --             end,
    --             filetypes = {
    --                 'javascript',
    --                 'javascriptreact',
    --                 'typescript',
    --                 'typescriptreact',
    --                 'vue',
    --             },
    --             settings = {
    --                 tsserver_plugins = {
    --                     '@vue/typescript-plugin',
    --                 },
    --                 jsx_close_tag = {
    --                     enable = true,
    --                     filetypes = { 'javascriptreact', 'typescriptreact' },
    --                 },
    --             },
    --         }
    --     end,
    -- })

    -- Completion
    use({
        "hrsh7th/nvim-cmp", -- Completion engine

        requires = {
            "hrsh7th/cmp-nvim-lsp",     -- LSP completion
            "hrsh7th/cmp-buffer",       -- Buffer completion
            "hrsh7th/cmp-path",         -- File path completion
            "L3MON4D3/LuaSnip",         -- Snippets
            "saadparwaiz1/cmp_luasnip", -- Snippet completion
            "rafamadriz/friendly-snippets"
        }
    })

    -- LSP
    use({
        "neovim/nvim-lspconfig",
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
    })

    -- File Tree
    use({
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
    })
end)
