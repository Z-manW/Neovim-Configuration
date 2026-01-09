return {
  {
    "williamboman/mason.nvim",
    config = true,
  },

  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "mason.nvim" },
    opts = {
      ensure_installed = {
        "lua_ls",
        "pyright",
        "clangd",
      },
    },
  },

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      -- Use the new handler-based setup
      require("mason-lspconfig").setup_handlers({
        function(server_name)
          vim.lsp.config(server_name, {})
        end,
      })

      -- LSP keymaps (buffer-agnostic for now)
      local map = vim.keymap.set
      map("n", "gd", vim.lsp.buf.definition)
      map("n", "K", vim.lsp.buf.hover)
      map("n", "<leader>rn", vim.lsp.buf.rename)
      map("n", "<leader>ca", vim.lsp.buf.code_action)
    end,
  },
}

