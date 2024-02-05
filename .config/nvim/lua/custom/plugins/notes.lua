return {
  {
    'epwalsh/obsidian.nvim',
    version = '*',
    lazy = false,
    ft = 'markdown',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'hrsh7th/nvim-cmp',
      'nvim-telescope/telescope.nvim',
      'nvim-treesitter'
    },
    opts = {
      workspaces = {
        {
          name = 'notes',
          path = vim.fn.expand '~' .. '/notes',
        }
      }
    },
    daily_notes = {
      folder = "dailies",
      date_format = "%Y-%m-%d",
      alias_format = "%B %-d, %Y",
    },
    ui = {
      enable = true,
      update_debounce = 200,

      checkboxes = {
        [" "] = { char = "[", hl_group = "ObsidianTodo" },
        ["+"] = { char = "+", hl_group = "ObsidianDone" },
        [">"] = { char = ">", hl_group = "ObsidianRightArrow" },
        ["~"] = { char = "~", hl_group = "ObsidianTilde" },
      },

      bullets = { char = "•", hl_group = "ObsidianBullet" },
      external_link_icon = { char = "@", hl_group = "ObsidianExtLinkIcon" },

      reference_text = { hl_group = "ObsidianRefText" },
      highlight_text = { hl_group = "ObsidianHighlightText" },
      tags = { hl_group = "ObsidianTag" },

      hl_groups = {
        ObsidianTodo = { bold = true, fg = "#f9e2af" },
        ObsidianDone = { bold = true, fg = "#a6e3a1" },
        ObsidianRightArrow = { bold = true, fg = "#74c7ec" },
        ObsidianTilde = { bold = true, fg = "#cba6f7" },
        ObsidianBullet = { bold = true, fg = "#89ddff" },
        ObsidianRefText = { underline = true, fg = "#c792ea" },
        ObsidianExtLinkIcon = { fg = "#c792ea" },
        ObsidianTag = { italic = true, fg = "#89ddff" },
        ObsidianHighlightText = { bg = "#75662e" },
      },
    },
    init = function()
      vim.api.nvim_create_user_command('Today', ':ObsidianToday', {})
      vim.api.nvim_create_user_command('Yesterday', ':ObsidianYesterday', {})
      vim.api.nvim_create_user_command('Tomorrow', ':ObsidianTomorrow', {})
    end
  }
}
