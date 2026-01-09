return {
  "lewis6991/gitsigns.nvim",
  config = function ()
    require("gitsigns").setup({
      signs = {
        add = { text = "+" },
        change = { text = "~" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
      },
      numhl = true,
      linehl = false,
      watch_gitdir = { interval = 1000 },
      current_line_blame = true,
      current_line_blame_opts = { delay = 500 },
    })
  end
}
