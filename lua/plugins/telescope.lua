return {
  -- Core Telescope
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local telescope = require("telescope")
      local builtin = require("telescope.builtin")

      telescope.setup({
        defaults = {
          layout_config = { prompt_position = "top" },
          sorting_strategy = "ascending",
        },
      })

      -- Keymaps
      vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
      vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live grep" })
      vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Buffers" })
      vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Help tags" })
    end,
  },

  -- Optional extensions
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
    cond = function() return vim.fn.executable("make") == 1 end,
  },

  require("telescope").setup({
    defaults = {
      prompt_prefix = "🔍 ",
      selection_caret = " ",
      path_display = { "truncate" },
      layout_strategy = "flex",
      layout_config = {
        horizontal = { preview_width = 0.55 },
        vertical = { width = 0.9, height = 0.95, preview_height = 0.5 },
      },
      sorting_strategy = "ascending",
      winblend = 10,           -- slight transparency
      borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    },
  })
    

--  {
--    "nvim-telescope/telescope-project.nvim",
--    dependencies = { "nvim-telescope/telescope.nvim" },
--    config = function()
--      require("telescope").load_extension("projects")
--    end,
--  },
}

