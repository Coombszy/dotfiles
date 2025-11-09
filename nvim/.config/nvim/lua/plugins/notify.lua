return {
  "rcarriga/nvim-notify",
  config = function()
    vim.notify = require("notify")
    vim.notify.setup({
      timeout = 10000,
      background_colour = "#000000",
      fps = 60,
      render = "wrapped-compact",
      stages = "slide"
    })
  end,
}
