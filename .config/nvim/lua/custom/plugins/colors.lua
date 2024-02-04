return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    lazy = false,
    opts = {
      flavour = 'mocha',
      transparent_background = true,
    },
    init = function()
      vim.cmd.colorscheme 'catppuccin-mocha'
    end
  }
}
