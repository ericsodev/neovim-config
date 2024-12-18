return {
  'ellisonleao/gruvbox.nvim',
  priority = 1000,
  config = function()
    require('gruvbox').setup {
      contrast = 'hard',
      dim_inactive = false,
      transparent_mode = false,
    }
  end,
}
