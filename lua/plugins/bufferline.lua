local dependencies = { "ThePrimeagen/harpoon" }

function config()
    -- local mark = require("harpoon.mark")
    -- require("bufferline").setup({
    --     options = {
    --         custom_filter = function(buf_number, _)
    --             local filename = vim.api.nvim_buf_get_name(buf_number)
    --             return vim.tbl_contains(mark.get_marked_files(), filename)
    --         end,
    --     },
    -- })
end

return {
    "akinsho/bufferline.nvim",
    dependencies = dependencies,
    config = config,
}
