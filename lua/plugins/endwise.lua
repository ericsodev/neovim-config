return {
  'RRethy/nvim-treesitter-endwise',
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
  },
  config = function()
    -- Requires nvim-treesitter installed
    require('nvim-treesitter.configs').setup {
      endwise = {
        enable = true,
      },
    }
  end,
}
