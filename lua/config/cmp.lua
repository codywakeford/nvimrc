local cmp = require("cmp")

require("luasnip.loaders.from_vscode").lazy_load({
    paths = "~/.config/nvim/snippets",
})

local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

ls.add_snippets("vue", {
    s("component", {
        t({
            "<template>",
            "",
        }),
        i(1),
        t({ "", "</template>", "", "" }),

        t({
            '<script setup lang="ts">',
            "",
        }),
        i(2),
        t({ "", "</script>", "", "" }),

        t({
            '<style scoped lang="scss">',
            "",
        }),
        i(3),
        t({ "", "</style>" }),
    }),
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

    window = {},
})
