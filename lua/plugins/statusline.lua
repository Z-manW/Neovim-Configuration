return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    options = {
      theme = "catppuccin",
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
