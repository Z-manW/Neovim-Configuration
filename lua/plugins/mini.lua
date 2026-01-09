return {
  "echasnovski/mini.nvim",
  branch = "stable",
  config = function()
    local mini = require("mini.cursorword")
    mini.setup()

    require("mini.move").setup()
    require("mini.animate").setup()
  end,
}
