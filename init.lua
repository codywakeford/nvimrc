require("cody")

vim.cmd([[
  autocmd VimEnter * Alpha
]])


vim.cmd [[
  autocmd FileType javascript,typescript,vue,html,json setlocal formatprg=prettier
]]

vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*",
  callback = function()
    local api = require("nvim-tree.api")
    if vim.bo.filetype ~= "NvimTree" then
      vim.defer_fn(function() api.tree.close() end, 5) -- Delay by 50ms
    end
  end,
})
