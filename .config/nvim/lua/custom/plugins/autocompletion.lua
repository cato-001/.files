return {
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-nvim-lsp',
      'rafamadriz/friendly-snippets',
    },
  },
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = true,
    init = function()
      local autopairs = require('nvim-autopairs');
      local Rule = require('nvim-autopairs.rule');
      autopairs.add_rules({
        Rule('<', '>'),
        Rule('{%', '%', 'htmldjango'),
      });
    end
  },
}
