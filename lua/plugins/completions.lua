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
			require("config.cmp")
		end
	}