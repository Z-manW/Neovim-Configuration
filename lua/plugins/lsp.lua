return {
  -- Mason installer
  {
    "williamboman/mason.nvim",
    config = true,
  },

  -- Mason-lspconfig ensures servers exist
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
    config = function(_, opts)
      require("mason-lspconfig").setup(opts)
    end,
  },

  -- LSPconfig: stable server setup
  {
    "neovim/nvim-lspconfig",
    dependencies = { "williamboman/mason-lspconfig.nvim" },
    config = function()
      local lspconfig = require("lspconfig")

      local servers = { "lua_ls", "pyright", "clangd" }
      for _, name in ipairs(servers) do
        lspconfig[name].setup({
          on_attach = function(client, bufnr)
            local opts = { noremap = true, silent = true, buffer = bufnr }
            local map = vim.keymap.set

            map("n", "gd", vim.lsp.buf.definition)
            map("n", "K", vim.lsp.buf.hover)
            map("n", "<leader>rn", vim.lsp.buf.rename)
            map("n", "<leader>ca", vim.lsp.buf.code_action)
          end
        })
    end
  end
  },
}

