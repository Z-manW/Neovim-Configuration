return {
  "nvim-lualine/lualine.nvim",
  -- FIX 1: Force lualine to wait until the catppuccin plugin is loaded
  dependencies = { 
    "nvim-tree/nvim-web-devicons",
    "catppuccin"
  },
  opts = {
    options = {
      -- FIX 2: Change "catppuccin" to "auto" so it inherits your theme safely
      theme = "auto",
      section_separators = "",
      component_separators = "",
      globalstatus = true, --statusline spans the whole window
    },
    sections = {
      lualine_a = {"mode"},
      lualine_b = {"branch"},
      lualine_c = {"filename"},
      lualine_x = {"diagnostics", "encoding", "fileformat", "filetype"},
      lualine_y = {"progress"},
      lualine_z = {"location"}
    }
  }
}

