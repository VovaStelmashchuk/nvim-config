return {
  {
    "m4xshen/autoclose.nvim",
    config = function()
      require('autoclose').setup({
        keys = {
          [">"] = { escape = false, close = false, pair = "><" },
        }
      })
    end
  },
  {
    'github/copilot.vim'
  }
}
