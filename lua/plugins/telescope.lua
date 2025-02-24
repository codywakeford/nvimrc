local dependencies = { "nvim-lua/plenary.nvim" }

function config()
  local builtin = require("telescope.builtin")

  vim.keymap.set("n", "'", builtin.find_files, { desc = "Telescope find files" })
  vim.keymap.set("n", "<C-p>", builtin.git_files, { desc = "Telescope find files" })
  vim.keymap.set("n", "@", ":Telescope live_grep<CR>", { noremap = true, silent = true })

  -- Obsidian
  local vault_path = "~/obsidian"
  vim.keymap.set(
    "n",
    "<leader>o",
    ":lua require('telescope.builtin').find_files({cwd='" .. vault_path .. "'})<CR>",
    { noremap = true, silent = true }
  )
  vim.keymap.set(
    "n",
    "<leader>O",
    ":lua require('telescope.builtin').live_grep({cwd='" .. vault_path .. "'})<CR>",
    { noremap = true, silent = true }
  )

  require("telescope").setup({
    pickers = {
      find_files = {
        hidden = true,
      },
    },
    defaults = {},
  })
end

return {
  "nvim-telescope/telescope.nvim",
  dependencies = dependencies,
  config = config,
}
