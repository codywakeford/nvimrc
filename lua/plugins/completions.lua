return {
	"hrsh7th/nvim-cmp", -- Completion engine

	dependencies = {
		"hrsh7th/cmp-nvim-lsp", -- LSP completion
		"hrsh7th/cmp-buffer", -- Buffer completion
		"hrsh7th/cmp-path", -- File path completion
		"L3MON4D3/LuaSnip", -- Snippets
		"saadparwaiz1/cmp_luasnip", -- Snippet completion
		"rafamadriz/friendly-snippets",
	},

	config = function()
		local cmp = require("cmp")

		require("luasnip.loaders.from_vscode").lazy_load({
			paths = "~/.config/nvim/snippets",
		})

		cmp.setup({

			mapping = cmp.mapping.preset.insert({
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-o>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.abort(),
				["<Tab>"] = cmp.mapping.confirm({ select = true }),
			}),

			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end,
			},

			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "buffer" },
				{ name = "path" },
			}),

			window = {
				completion = {
					border = "single",
					col_offset = 0,
					side_padding = 1,
				},
				documentation = {
					border = "single",
					col_offset = 0,
					side_padding = 1,
				},
			},
		})
	end,
}

