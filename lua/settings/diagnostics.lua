-- Diagnostics configuration
vim.diagnostic.config({
    virtual_text = {
        prefix = "●", -- Custom icon for errors and warnings
        spacing = 4, -- Add spacing between the error/warning and the line
    },
    signs = true, -- Enable diagnostic signs in the gutter
    update_in_insert = true, -- Update diagnostics while typing in insert mode
    underline = true, -- Underline errors and warnings
    severity_sort = true, -- Sort diagnostics by severity (errors first)
})

-- Set custom diagnostic symbols in the gutter
local signs = { Error = "✗", Warn = "⚠", Info = "ℹ", Hint = "💡" }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
