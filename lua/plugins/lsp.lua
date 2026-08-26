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

  -- LSPconfig: Uses Neovim's modern native activation framework
  {
    "neovim/nvim-lspconfig",
    dependencies = { "williamboman/mason-lspconfig.nvim" },
    config = function()
      -- Create an Autocommand to apply keymaps whenever an LSP server attaches to a file
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local bufnr = args.buf
          local opts = { noremap = true, silent = true, buffer = bufnr }
          local map = vim.keymap.set

          map("n", "gd", vim.lsp.buf.definition, opts)
          map("n", "K", vim.lsp.buf.hover, opts)
          map("n", "<leader>rn", vim.lsp.buf.rename, opts)
          map("n", "<leader>ca", vim.lsp.buf.code_action, opts)
        end,
      })

      -- Modern Neovim 0.11+ method to turn on the configurations natively
      local servers = { "lua_ls", "pyright", "clangd" }
      for _, name in ipairs(servers) do
        vim.lsp.enable(name)
      end
    end
  },
}

