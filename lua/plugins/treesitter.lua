return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  opts = {
    ensure_installed = {
      "lua",
      "vim",
      "vimdoc",
      "bash",
      "python",
      "c",
      "cpp",
      "json",
      "yaml",
      "markdown",
    },
    highlight = {
      enable = true,
    },
    indent = {
      enable = true,
    },
  },
}

