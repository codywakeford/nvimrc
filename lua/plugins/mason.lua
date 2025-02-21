return {
  -- mason.nvim plugin
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup({})
    end
  },
  -- mason-lspconfig.nvim plugin
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
                    require("mason-lspconfig").setup({})
    end
  }
}
