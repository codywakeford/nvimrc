local lspconfig = require("lspconfig")

require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = {
        "eslint",
        "volar",
        "lua_ls", },
    automatic_installation = true,
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Setup LSPs
lspconfig.volar.setup {
    -- add filetypes for typescript, javascript and vue
    filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
    init_options = {
        vue = {
            -- disable hybrid mode
            hybridMode = false,
        },
    },
}

lspconfig.lua_ls.setup({
    capabilities = capabilities,
})


lspconfig.eslint.setup({
    capabilities = capabilities,
    filetypes = { 'javascript', 'typescript', "vue" },
    settings = {
        eslint = {
            enable = true,
            packageManager = 'npm',
            nodePath = '/home/cody/.nvm/versions/node/v18.20.5/bin/node',
        },
    },
    on_attach = function(client, bufnr)
        -- Enable virtual text for diagnostics
        vim.diagnostic.config({
            virtual_text = {
                prefix = '●', -- You can customize this to any symbol
                spacing = 0,
            },
            update_in_insert = true, -- Show diagnostics while typing in insert mode
        })
    end,
})


-- Format on save
vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)

        if not client then
            return
        end

        if client.supports_method("textDocument/formatting", 0) then
            vim.api.nvim_create_autocmd("BufWritePre", {
                buffer = args.buf,
                callback = function()
                    vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
                end,
            })
        end
    end,
})
