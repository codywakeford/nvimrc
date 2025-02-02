local cmp = require("cmp")

require("luasnip.loaders.from_vscode").lazy_load({
    paths = "~/.config/nvim/snippets"
})

local ls = require("luasnip")

ls.snippets = {
    vue = {
        ls.parser.parse_snippet("iconify", "import { Icon } from \"@vue/iconify\"")
    }
}

cmp.setup({
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-o>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
    }),
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'buffer' },
        { name = "path" }
    }),

    window = {

    }
})
